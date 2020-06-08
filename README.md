# react-native-jointag

## Getting started

`$ npm install react-native-jointag --save`

### Mostly automatic installation

`$ react-native link react-native-jointag`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-jointag` and add `Jointag.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libJointag.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainApplication.java`
  - Add `import com.reactlibrary.JointagPackage;` to the imports at the top of the file
  - Add `new JointagPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-jointag'
  	project(':react-native-jointag').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-jointag/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-jointag')
  	```


## Usage
```javascript
import Jointag from 'react-native-jointag';

// TODO: What to do with the module?
Jointag;
```
