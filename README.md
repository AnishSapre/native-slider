# native-slider

[![npm](https://img.shields.io/npm/v/native-slider.svg)](https://www.npmjs.com/package/native-slider) [![license](https://img.shields.io/npm/l/native-slider.svg)](https://github.com/AnishSapre/native-slider/blob/main/LICENSE)

**npm:** [native-slider](https://www.npmjs.com/package/native-slider) · **GitHub:** [AnishSapre/native-slider](https://github.com/AnishSapre/native-slider)

Apple's `UISlider` for React Native's New Architecture. On iOS 26 its thumb is the
system **liquid glass** knob that magnifies while you drag it.

## Requirements

- React Native 0.76+ with the **New Architecture** (Fabric). This is a Fabric component;
  it has no old-architecture (Paper) implementation.
- **iOS only.** On Android the component renders nothing, so check `isAvailable` (or
  `Platform.OS`) and render your own fallback there.
- The liquid glass look needs **iOS 26+** (built with the iOS 26 SDK or later). On earlier
  iOS you get the classic system look. `hasLiquidGlass` tells you which one is showing.

## Install

```sh
npm install native-slider
cd ios && pod install
```

Then rebuild the app (a Metro reload is not enough for new native code).

## Usage

```tsx
import { Slider } from 'native-slider'

<Slider
  value={position}
  maximumValue={duration}
  onValueChange={setPreview}
  onSlidingComplete={seekTo}
  minimumTrackTintColor="#4D2E97"
/>
```

| Prop | Type | |
|---|---|---|
| `value` | `number` | Controlled; the thumb is never moved out from under the user's finger |
| `minimumValue` / `maximumValue` | `number` | Default 0 / 1 |
| `onValueChange` | `(value) => void` | While dragging |
| `onSlidingStart` / `onSlidingComplete` | `(value) => void` | Touch down / let go |
| `minimumTrackTintColor` / `maximumTrackTintColor` | colour | |
| `disabled` | `boolean` | |
| `style` | ViewStyle | Default height 40 |
| `testID` | `string` | |

## How it works

A small Fabric component wraps Apple's own UIKit control, so iOS draws and animates it.
React Native's codegen builds the bridge from the TypeScript spec in
`src/*NativeComponent.ts` during `pod install`.

## Related packages

Native iOS controls for React Native (New Architecture), with liquid glass on iOS 26:

- [native-tab-bar](https://github.com/AnishSapre/native-tab-bar) ([npm](https://www.npmjs.com/package/native-tab-bar)): Apple's UITabBar (iOS 26 liquid glass tab bar) with a React Navigation adapter
- [native-segmented-control](https://github.com/AnishSapre/native-segmented-control) ([npm](https://www.npmjs.com/package/native-segmented-control)): Apple's UISegmentedControl
- [native-glass-button](https://github.com/AnishSapre/native-glass-button) ([npm](https://www.npmjs.com/package/native-glass-button)): iOS 26 liquid glass buttons and menus

## License

MIT © Anish Sapre
