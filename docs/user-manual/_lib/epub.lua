-- Copyright 2026 The terCAD team. All rights reserved.
-- Use of this content is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

-- Pandoc filter for EPUB: listings options (`label=...`, `caption=...`) are copied by pandoc as raw HTML attributes,
-- while `label` is not allowed in EPUB (XHTML) and fails the validation (RSC-005). The label is already used as `id`,
-- so it's dropped; the caption is shown as a paragraph below the code block (as "Listing" in the PDF version).
function CodeBlock(block)
  local caption = block.attributes['caption']
  block.attributes['label'] = nil
  block.attributes['caption'] = nil
  if caption then
    return { block, pandoc.Para({ pandoc.Emph(pandoc.Str(caption)) }) }
  end
  return block
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
