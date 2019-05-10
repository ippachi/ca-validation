# Ca::Validation
Wrap the dry-validation for rails

## Usage
First you should define a validator class.

```ruby
class AddBookValidator
  include Ca::Validation

  validate do
    required(:book).schema do
      required(:title).filled(:str?)
      required(:author_name).filled(:str?)
    end
  end
end
```

Then you can use `valid?`

```ruby
def create
  if params.valid?(AddBookValidator)
    book = Book.create(params.result[:book])
    redirect_to book
  else
    render :new
  end
end
```

```erb
<% if params.errors.any? %>
  <div id="error_explanation">
    <h2><%= pluralize(params.errors[:book].count, "error") %> prohibited this book from being saved:</h2>

    <ul>
    <% params.errors(full: true)[:book].each do |k, message| %>
      <li><%= message.first %></li>
    <% end %>
    </ul>
  </div>
<% end %>
```

You can reference https://dry-rb.org/gems/dry-validation/comparison-with-activemodel/

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'ca-validation'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install ca-validation
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
