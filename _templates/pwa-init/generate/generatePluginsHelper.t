const phoneUtil = require('google-libphonenumber').PhoneNumberUtil.getInstance();

const helper = () => ({
  phoneNumberSend(number) {
    let phone;
    if (number.charAt(0) === '0') {
      phone = '+62' + number.replace('0', '');
    } else if (number.slice(0, 3) === '+62') {
      phone = '+62' + number.replace('+62', '');
    } else {
      phone = '+62' + number;
    }
    return phone;
  },
  phoneNumberInput(number) {
    let phone;
    if (number.charAt(0) === '0') {
      phone = number.replace('0', '');
    } else if (number.slice(0, 3) === '+62') {
      phone = number.replace('+62', '');
    } else {
      phone = number;
    }
    return phone;
  },
  countryCode(phoneNumber) {
    if (phoneNumber) {
      const rawPhoneData = phoneUtil.parseAndKeepRawInput(phoneNumber);
      const countryCode = phoneUtil.getRegionCodeForNumber(rawPhoneData);
      return countryCode;
    }
    return 'ID';
  },
  currencyToNumber(value = String(), separator = '.') {
    let nums = value.split(separator).join('');
    return Number(nums);
  },
})

export default ({ app }, inject) => {
  inject('helper', helper(app));
};
