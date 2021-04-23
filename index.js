import { NativeModules } from 'react-native';
const { Jointag } = NativeModules;
const JTConstants = Jointag.getConstants();
export { JTConstants };
export default Jointag;
