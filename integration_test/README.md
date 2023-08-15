## Tips to evaluate Integration Tests

```
flutter drive \
  --driver=test_driver/perf_driver.dart \
  --target=integration_test/{name}_test.dart \
  --no-dds
```

P.S. Launch Chrome Driver `chromedriver --port=4444` for Web profiling
