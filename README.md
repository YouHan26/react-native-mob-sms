
# react-native-mob-sms

### 支持MOB-SMS 最新SDK

## Getting started

`$ npm install react-native-mimikiy-mob-sms --save`

### Mostly automatic installation

`$ react-native link react-native-mimikiy-mob-sms`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-mimikiy-mob-sms` and add `RNMobSms.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNMobSms.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

## Usage
```javascript
import MobSms from 'react-native-mimikiy-mob-sms';


MobSms.getVerificationCode('131XXXXXX', '86', function(error){
 if(error){
  console.log(error);
 }
})

  MobSms.commitVerificationCode('1111', '131111111', '86', function(error){
   if(error){
     console.log(error)
    }
  })
  
  
  
  
  ```
