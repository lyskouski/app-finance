## Tips to evaluate Performance Tests:

```
flutter drive \
  --driver=test_driver/perf_driver.dart \
  --target=test/performance/{name}_test.dart \
  --no-dds
```

P.S. Launch Chrome Driver `chromedriver --port=4444` for Web profiling
