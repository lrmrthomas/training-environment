#*******************************************************************
# Common methods which are called by mutiple step definitions
#*******************************************************************

def AccessLoginPage()
  # Visit main page
  visit('http://localhost:4567')
end

def LoginPageSignIn(userName, userPassword)
  # Fill in the login detail using the passed in parameters
  fill_in('username', :with => userName)
  fill_in('password', :with => userPassword)
  # Click the 'Sign in' button to login
  click_button('Sign in')
end
