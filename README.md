# Kanpachi Example

[Kanpachi](https://github.com/kamui/kanpachi) is a ruby gem that provides a DSL to describe your web API, generate
documentation, and will even eventually help you implement it.

This project is an example project partially implementing Twitter's API in Kanpachi.

## Installation

    $ git clone git@github.com:kamui/kanpachi-example.git

## Usage

### Build HTML documentation

    $ kanpachi build

HTML files and assets will be built in the `build` directory.

### Start a documentation server

    $ kanpachi server

Then open <http://0.0.0.0:4567> in your browser.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
