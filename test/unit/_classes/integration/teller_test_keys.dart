// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

// Self-signed test certificate (CN=fingrom-test) with its EC private key: not issued by Teller
const tellerTestCertificate = '''
-----BEGIN CERTIFICATE-----
MIIBhjCCASugAwIBAgIUDiHRIQ5e6sTxZXI/WyRTGPLk24EwCgYIKoZIzj0EAwIw
FzEVMBMGA1UEAwwMZmluZ3JvbS10ZXN0MCAXDTI2MTEyNTE2MTcyMVoYDzIxMjYx
MTAxMTYxNzIxWjAXMRUwEwYDVQQDDAxmaW5ncm9tLXRlc3QwWTATBgcqhkjOPQIB
BggqhkjOPQMBBwNCAAQPWNkLJV/8a1K/0htbNouRygWtLORcMlyKfhumO/ZYRPlU
c6E5Vkd+YeENmGmsmLqVmom/3+cy/rYfK2KV7XGPo1MwUTAdBgNVHQ4EFgQU3x8h
H73RCsARivgvqZ58IuzNx0gwHwYDVR0jBBgwFoAU3x8hH73RCsARivgvqZ58IuzN
x0gwDwYDVR0TAQH/BAUwAwEB/zAKBggqhkjOPQQDAgNJADBGAiEA03Ok644gtjb6
bvxea/i/lqcTRgNFQr/kPAY5HEkMQLoCIQCCq1J68ziHOa+VxsPLl0zJPDfKg+AS
cez21G9fpZ6EGA==
-----END CERTIFICATE-----
''';

const tellerTestKey = '''
-----BEGIN PRIVATE KEY-----
MIGHAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBG0wawIBAQQghX0YPRZBPA1iqZi4
5X/shPglIgFsWdVD1kGsr4HACLqhRANCAAQPWNkLJV/8a1K/0htbNouRygWtLORc
MlyKfhumO/ZYRPlUc6E5Vkd+YeENmGmsmLqVmom/3+cy/rYfK2KV7XGP
-----END PRIVATE KEY-----
''';
