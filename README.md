# native-slider

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

## License

MIT © Anish Sapre
