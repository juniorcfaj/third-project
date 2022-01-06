# #!/usr/bin/env python
from selenium import webdriver
from selenium.webdriver.chrome.options import Options as ChromeOptions
from selenium.webdriver.common.by import By

driver = webdriver.Chrome()
print ('Browser started successfully. Navigating to the demo page to login.')
driver.get('https://www.saucedemo.com/')

driver.find_element(By.ID, 'user-name').send_keys("standard_user")
driver.find_element(By.ID, 'password').send_keys("secret_sauce")
driver.find_element(By.ID, 'login-button').click()