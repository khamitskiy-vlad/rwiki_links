# RWikiLinks

`RWikiLinks` is a Ruby gem designed to generate citation links for news articles. The gem extracts key information such as the article title, author, publication date, and publisher, and formats it into a citation string.

---

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rwiki_links'
```

Then execute:

```bash
bundle install
```

Or install it directly using:

```bash
gem install rwiki_links
```

---

## Usage

### Basic Example

To generate a citation for a news article, simply pass the article's URL to the `citeweb` method:

```ruby
require 'rwiki_links'

url = 'https://www.vedomosti.ru/example'
citation = RwikiLinks.citeweb(url)

puts citation
```

### Output Example

The output will look like this:

```plaintext
{{cite web|author=Иванов, Иван|url=https://www.vedomosti.ru/example|title=Example News Title|lang=ru|website=vedomosti.ru|publisher=Ведомости|date=2025-01-25|access-date=2025-01-26}}
```

---

## Supported Websites

The gem currently works well with the following Russian news websites:

- **RIA Novosti** (`ria.ru`)
- **TASS** (`tass.ru`)
- **Kommersant** (`kommersant.ru`)
- **RBC** (`rbc.ru`)
- **Gazeta.ru** (`gazeta.ru`)
- **Lenta.ru** (`lenta.ru`)
- **Vedomosti** (`vedomosti.ru`)
- **MK.ru** (`mk.ru`)
- **RT** (`russian.rt.com`)
- **News.ru** (`news.ru`)
- etc.

---

## How It Works

RwikiLinks extracts the following information from a news article:

1. **Title**: The title of the article.
2. **Author**: The author's name (if available).
3. **Date**: The publication date.
4. **Publisher**: The name of the news website or organization.
5. **Language**: The language of the article (e.g., `ru` for Russian).

The gem uses Nokogiri to parse the HTML of the article and XPath to locate the required data.

---

## Future Plans

The first version of RwikiLinks is optimized for Russian news websites. In future updates, the gem will be expanded to support more websites globally, making it a universal tool for generating citations.

---

## Contributing

If you'd like to contribute to `RWikiLinks`, feel free to open an issue or submit a pull request. Contributions are welcome, especially for adding support for new websites or improving existing functionality.

---

## License

RwikiLinks is available under the MIT License. See the [LICENSE](LICENSE) file for more details.

---

## Questions?

If you have any questions or need help, feel free to open an issue on GitHub or contact the maintainers.

---

Enjoy using RwikiLinks! 🚀
