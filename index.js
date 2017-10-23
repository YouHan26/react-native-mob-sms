/**
 * Created by youhan on 2017/1/11.
 */
import {NativeModules} from 'react-native';

const {MobSMS} = NativeModules;

const isError = (str) => {
  return str.indexOf('null') === -1;
};

MobSMS.init(1);

const getVerificationCode = (phoneNumber, zone, cb) => {
  MobSMS.getVerificationCodeByMethod(0, phoneNumber, zone, null, (error) => {
    cb(isError(error.code));
  });
};

const commitVerificationCode = (code, phoneNumber, zone, cb) => {
  MobSMS.commitVerificationCode(code, phoneNumber, zone, (error) => {
    cb(isError(error.code));
  });
};

export default {
  getVerificationCode,
  commitVerificationCode
};
