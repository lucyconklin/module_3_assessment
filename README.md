## Storedom

Storedom is a simplistic e-commerce application used for various lessons and tutorials at Turing. This Mod3 assessment includes an external API call to the pleasantly well documented [Best Buy API](https://bestbuyapis.github.io/api-documentation/#user-guide) to get the nearest stores to a given zipcode.

### Setup

To get set up with the storedom application, clone it
via `git` and pull in gem dependencies with `bundler`:

```sh
$ git clone https://github.com/lucyconklin/module_3_assessment.git
$ cd storedom
$ bundle
```

And set up the database and included seed records:

```
rake db:{create,setup}
```

get your server started with
```
rails s
```

and navigate to [localhost:3000](http://0.0.0.0:3000/) to see it in action.

### Best Buy API

[Sign up for an API key](https://developer.bestbuy.com/), and add it to your application.yml.
```
# application.yml
test:
  BEST_BUY_API_KEY: XXXX

development:
  BEST_BUY_API_KEY: XXXX

production:
  BEST_BUY_API_KEY: XXXX
```
