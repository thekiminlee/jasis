# Ruby Starter Framework

Jasis is an eloquent Ruby framework, that provides you a nice boilerplate code to get you started developing websites as quickly as possible.
It was inspired heavily by Padrino, but it takes it a notch further in terms of simplification by keeping Sinatra to it's core as much as possible. You won't see any Jasis library here, it will be just several Ruby gems put together on top of the Sinatra framework.

### What is Jasis?

1. 100% Docker-based for easy setup and deployment
2. Explicit by design, no more black magic, know how everything gets loaded
3. Minimal to the core (less files, less codes)
4. Stupidly simple (no crazy class hierchy, just plain simple approach)
5. Faster and lighter, up to 30% ~ 40% faster than Rails

### Pre-requisites

It needs Docker with:
1)  dnsmasq
2) jwilder/nginx-proxy
3) docker-compose

Or you can simply install:
dinghy for OSX
or 
dory for Ubuntu / Linux

Run the jwilder/proxy daemon if you haven't already:

```
docker run --name=proxy --restart=always -d -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy
```

### Install
1) git clone https://github.com/jaequery/jasis
2) cd jasis
3) docker-compose up -d
4) your site should now show up on http://jasis.docker (update VIRTUAL_HOST from docker-compose.yml)


### Checklist
- [x] setup sinatra modular structure with sequel / postgres
- [x] add Docker support
- [x] add migrations
- [x] add seeds
- [x] add email w/ template support
- [x] add bettererrors
- [x] add db export, db import sh scripts
- [x] add deploy script
- [ ] add admin
- [ ] add blog
- [ ] add shop
- [ ] add forum

### Some of the essential features that makes Jasis great!

#### error debugging with bettererrors 

![screenshot](https://d3vv6lp55qjaqc.cloudfront.net/items/2w1d3G2t1T2D3A391r2E/Image%202018-03-26%20at%208.45.20%20AM.png?X-CloudApp-Visitor-Id=1367442&v=280965c1)


#### dotenv for dev / production environment variables
To set environmental variables depending on your environment, we used dotenv. You simply place a .env file at the root of the app folder.

.env (base)
.env.development
.env.production

Within it, you can simply have:

```
TWITTER_KEY=xxxxx
TWITTER_SECRET=xxxxx
```

And you would call it from your app using:

```
ENV['TWITTER_KEY']
```

#### Send Emails

1. Configure your SMTP settings from the .env file
2. Call the email() helper function within the controllers

Standard Email
```
email({:from => 'me@email.com', :to => 'user@email.com', :subject => 'hi', :body => 'Hello'})
```

Email through a liquid file
```
email({:to => 'user@email.com', :subject => 'hi'}, {:file => "emails/welcome.liquid", :data => {'name' => 'john'} })
```
