__author__ = 'Sebastian Zillessen'
__version__ = "1.0"
# inspired by http://elinux.org/RPi_Email_IP_On_Boot_Debian


import subprocess
import smtplib
import os
import socket
from email.mime.text import MIMEText
import datetime

# Change to your own account information
# Account Information
to = os.environ['ADMIN_MAIL']                       || 'username@email.com'     # Email to send to.
gmail_user = os.environ['GMAIL_SEND_EMAIL']         || 'username@gmail.com'     # Email to send from. (MUST BE GMAIL)
gmail_password = os.environ['GMAIL_SEND_PASSWORD']  ||'gmailpassword'           # Gmail password.


smtpserver = smtplib.SMTP('smtp.gmail.com', 587) # Server to use.

smtpserver.ehlo()  # Says 'hello' to the server
smtpserver.starttls()  # Start TLS encryption
smtpserver.ehlo()
smtpserver.login(gmail_user, gmail_password)  # Log in to server
today = datetime.date.today()  # Get current time/date

arg='ifconfig | awk -F "[: ]+" \'/inet addr:/ { if ($4 != "127.0.0.1") print $4 }\''  # Linux command to retrieve ip addresses.
# Runs 'arg' in a 'hidden terminal'.
p=subprocess.Popen(arg,shell=True,stdout=subprocess.PIPE)
ip_addresses = p.communicate()[0]  # Get data from 'p terminal'.

hostname = socket.gethostbyaddr(socket.gethostname())[0]

text = 'Your %s ip addresses are \n %s' % (hostname, ip_addresses)

# Creates the text, subject, 'from', and 'to' of the message.
msg = MIMEText(text)
msg['Subject'] = 'IPs For RaspberryPi on %s' % today.strftime('%b %d %Y')
msg['From'] = gmail_user
msg['To'] = to
# Sends the message
smtpserver.sendmail(gmail_user, [to], msg.as_string())
# Closes the smtp server.
smtpserver.quit()

