-- Copyright 2026 The terCAD team. All rights reserved.
-- Use of this content is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

-- Pandoc filter for EPUB: listings options (`label=...`, `caption=...`) are copied by pandoc as raw HTML attributes,
-- while `label` is not allowed in EPUB (XHTML) and fails the validation (RSC-005). The label is already used as `id`,
-- so it's dropped; the caption is shown as a paragraph below the code block (as "Listing" in the PDF version).
function CodeBlock(block)
  local caption = block.attributes['caption']
  block.attributes['label'] = nil
  block.attributes['caption'] = nil
  -- `firstnumber=...` becomes `data-startFrom`, invalid in XHTML (HTM_061: no uppercase letters); line numbers are not
  -- rendered in EPUB anyway
  block.attributes['startFrom'] = nil
  if caption then
    return { block, pandoc.Para({ pandoc.Emph(pandoc.Str(caption)) }) }
  end
  return block
end

-- A `\label` that is not attached directly to a heading (e.g. placed after `\markboth`) becomes a separate empty span
-- (`<span id="dart" label="dart">`). It duplicates the auto-generated identifier of the heading (RSC-005: Duplicate ID)
-- and carries the disallowed `label` attribute. Such a label is moved to the preceding heading instead.
local function isLabelPara(block)
  if block == nil or block.t ~= 'Para' or #block.content ~= 1 then
    return false
  end
  local span = block.content[1]
  return span.t == 'Span' and #span.content == 0 and span.identifier ~= ''
end

function Blocks(blocks)
  local result = pandoc.Blocks({})
  local i = 1
  while i <= #blocks do
    local block = blocks[i]
    if block.t == 'Header' and isLabelPara(blocks[i + 1]) then
      block.identifier = blocks[i + 1].content[1].identifier
      i = i + 1
    end
    result:insert(block)
    i = i + 1
  end
  return result
end

-- Links to application-specific schemes (e.g. `chrome://inspect`) cannot be opened from a reader (HTM-025), so they
-- are shown as inline code
function Link(link)
  local scheme = link.target:match('^([%a][%w+.-]*):')
  if scheme and not ({ http = true, https = true, mailto = true })[scheme:lower()] then
    return pandoc.Code(link.target)
  end
  return link
end

function Span(span)
  span.attributes['label'] = nil
  return span
end

function Div(div)
  div.attributes['label'] = nil
  return div
end

-- EPUB is split into several files (one per section), and pandoc rewrites cross-file links only for anchors it tracks
-- (headers and divs), not for figures: `\cref{img:...}` to a figure of another section points to a missing fragment
-- (RSC-012). Moving the identifier to a wrapping div makes such links resolvable.
function Figure(figure)
  local id = figure.identifier
  if id == nil or id == '' then
    return figure
  end
  figure.identifier = ''
  return pandoc.Div({ figure }, pandoc.Attr(id))
end
