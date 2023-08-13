切换启动首页：src/main/ets/componentability/ComponentAbility.ts > `windowStage.loadContent()`

```tsx
onWindowStageCreate(windowStage: window.WindowStage) {
   ...
    windowStage.loadContent('pages/componentmanagement/MainPage', (err, data) => {
        ...
    });
  }
```