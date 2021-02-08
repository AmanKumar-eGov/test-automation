Feature: Create Citizen Pretest Feature
Background:
  * def jsUtils = read('classpath:jsUtils.js')
  * def citizenPayload = read('../../core-services/requestPayload/user/citizenCreation.json')
  * def createCitizenvalidPayload = citizenPayload.validPayload
  * def citizenWithoutUserNamePayLoad = citizenPayload.withoutUserNamePayload
  * def citizenWithoutName = citizenPayload.withoutNamePayload
  * def citizenWithoutTenantId = citizenPayload.withoutTenantIdPayload
  * def citizenWithInvalidUserName = citizenPayload.invalidUserNamePayload
  * def citizenWithName = citizenPayload.withNamePayload
  * configure headers = read('classpath:websCommonHeaders.js')
  * def otpReference = '348356'
  * def mobileNumberGen = randomMobileNumGen(10)
  * def mobileNumber = new java.math.BigDecimal(mobileNumberGen)
  * print mobileNumber
  * def name = ranString(4)
  * def permanentCity = cityCode
  * def invalidMobileNo = ranString(6)
  * def moreThan50CharsName = 'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabc'
  
  * set createCitizenvalidPayload.User.username = mobileNumber
  * set createCitizenvalidPayload.User.otpReference = otpReference
  * set createCitizenvalidPayload.User.name = name
  * set createCitizenvalidPayload.User.permanentCity = permanentCity

  * set citizenWithoutUserNamePayLoad.User.otpReference = otpReference
  * set citizenWithoutUserNamePayLoad.User.name = name
  * set citizenWithoutUserNamePayLoad.User.permanentCity = permanentCity

  * set citizenWithoutName.User.username = mobileNumber
  * set citizenWithoutName.User.otpReference = otpReference
  * set citizenWithoutName.User.permanentCity = permanentCity

  * set citizenWithoutTenantId.User.username = mobileNumber
  * set citizenWithoutTenantId.User.otpReference = otpReference
  * set citizenWithoutTenantId.User.name = name
  * set citizenWithoutTenantId.User.permanentCity = permanentCity

  * set citizenWithInvalidUserName.User.username = invalidMobileNo
  * set citizenWithInvalidUserName.User.otpReference = otpReference
  * set citizenWithInvalidUserName.User.name = name
  * set citizenWithInvalidUserName.User.permanentCity = permanentCity
  
  * set citizenWithName.User.username = mobileNumber
  * set citizenWithName.User.otpReference = otpReference
  * set citizenWithName.User.name = moreThan50CharsName
  * set citizenWithName.User.permanentCity = permanentCity
  

  @createCitizen 
  Scenario: Create citizen
     Given url createCitizen 
     * print createCitizen  
     And request createCitizenvalidPayload
     * print createCitizenvalidPayload
     When method post
     Then status 400
     And def createCitizenResponseHeader = responseHeaders
     And def createCitizenResponseBody = response

  @createCitizenWithoutUsername
  Scenario: Create Citizen Without Username
     Given url createCitizen 
     * print createCitizen  
     And request citizenWithoutUserNamePayLoad
     * print citizenWithoutUserNamePayLoad
     When method post
     Then status 400
     And def createCitizenResponseHeader = responseHeaders
     And def createCitizenResponseBody = response

  @createCitizenWithoutName
  Scenario: Create Citizen Without Name
     Given url createCitizen 
     * print createCitizen  
     And request citizenWithoutName
     * print citizenWithoutName
     When method post
     Then status 400
     And def createCitizenResponseHeader = responseHeaders
     And def createCitizenResponseBody = response

  @createCitizenWithoutTenantId
  Scenario: Create Citizen Without TenantId
     Given url createCitizen 
     * print createCitizen  
     And request citizenWithoutTenantId
     * print citizenWithoutTenantId
     When method post
     Then status 400
     And def createCitizenResponseHeader = responseHeaders
     And def createCitizenResponseBody = response

  @createCitizenWithInvalidUsername
  Scenario: Create Citizen With Invalid Username
     Given url createCitizen 
     * print createCitizen  
     And request citizenWithInvalidUserName
     * print citizenWithInvalidUserName
     When method post
     Then status 400
     And def createCitizenResponseHeader = responseHeaders
     And def createCitizenResponseBody = response

  @createCitizenWithNameMoreThan50chars
  Scenario: Create Citizen With Name More Than 50chars
     Given url createCitizen 
     * print createCitizen  
     And request citizenWithName
     * print citizenWithName
     When method post
     Then status 400
     And def createCitizenResponseHeader = responseHeaders
     And def createCitizenResponseBody = response