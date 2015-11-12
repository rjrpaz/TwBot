#!/usr/bin/env python

import tweepy

CONSUMER_KEY = 'REPLACE_CONSUMER_KEY'
CONSUMER_SECRET = 'REPLACE_CONSUMER_SECRET'

auth = tweepy.OAuthHandler(CONSUMER_KEY, CONSUMER_SECRET)
auth_url = auth.get_authorization_url()
print 'Please authorize: ' + auth_url
verifier = raw_input('PIN: ').strip()
auth.get_access_token(verifier)

print "ACCESS_KEY = '%s'" % auth.access_token
print "ACCESS_SECRET = '%s'" % auth.access_token_secret
