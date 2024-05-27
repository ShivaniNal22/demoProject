class Util {



  static bool isEmailValid(String email) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex =  RegExp(pattern);
    return !regex.hasMatch(email) ? false : true;
  }


  // Validate Indian vehicle number
  static bool isValidIndianVehicleNumber(String vehicleNumber) {
    // Remove all whitespace from the input string
    vehicleNumber = vehicleNumber.replaceAll(RegExp(r'\s+'), '');

    // Define a regular expression pattern for Indian vehicle numbers
    RegExp indianVehicleNumberPattern = RegExp(r'^[A-Z]{2}[0-9]{1,2}[A-Z]{1,2}[0-9]{4}$');

    // Check if the input string matches the pattern
    return indianVehicleNumberPattern.hasMatch(vehicleNumber);
  }



  /*Here, We have set 10 digits validation on mobile number.*/
  static bool isMobileValid(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return false;
    } else if (value.length != 10) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  /* Function For PinCode */
  static bool isPinCodeValid(String value) {
    String pattern = r'^\d+(?:\.\d+)?$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  /*Here, we have validate entered password according to requirement*/
  static bool isPasswordValid(String password) {
    int passLength = password
        .trim()
        .length;
    return passLength < 5 || passLength > 21 ? false : true;
  }

  /*function for validate name*/
  static bool isNameValid(String value) {
    String pattern = r'(^[a-zA-Z\\s]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length < 2 || value.length > 15) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  static bool isEnrollNoValid(String value) {
    String pattern = r'(^[a-zA-Z0-9#/-_])';
    RegExp regExp = new RegExp(pattern);
    /* if (value.length < 2 || value.length > 15) {
      return false;
    } else*/
    if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  static bool isFullNameValid(String value) {
    String pattern = r'^[a-z A-Z,.\-]+$';
    RegExp regExp = RegExp(pattern);
    if (value.length < 2 || value.length > 100) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  /*Here, We have set validation on Comments .*/
  static bool isFullName(String value) {
    bool status = false;
    int enterCommentLength = value.length;
    status = enterCommentLength > 3 ? true : false;
    /* if(enterCommentLength>9 && enterCommentLength<50){
      staus=true;
    }*/
    return status;
  }


/*Here, We have set 4 digits validation on OTP .*/
  static bool isOTPValid(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return false;
    } else if (value.length != 4) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

}