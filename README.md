## Hexlet tests and linter status:
[![Actions Status](https://github.com/Avanera/rails-project-64/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/Avanera/rails-project-64/actions)

Deployed application link: https://rails-project-64-0rax.onrender.com/

This is a simple blogging platform built with Ruby on Rails 7, using PostgreSQL for the database, and Slim for templating. The project includes features such as user authentication, post creation, commenting, and liking posts.

## Prerequisites

Ruby version: 3.2.2
Rails version: 7.x
Database: PostgreSQL

## System Dependencies

Ensure you have PostgreSQL installed and running on your machine.
Node.js and Yarn are required for managing frontend assets.

## Configuration

1. Clone the repository:
```bash
git clone https://github.com/Avanera/rails-project-64.git
cd rails-project-64
```
2. Install required gems:
```bash
bundle install
```
3. Install JavaScript dependencies:
```bash
yarn install
```

## Database Setup

1. Create the database:
```bash
rails db:create
```
2. Run the migrations:
```bash
rails db:migrate
```
3. Seed the database:
```bash
rails db:seed
```

## Running the Application

1. Start the Rails server:
```bash
make start
```
2. Navigate to http://localhost:3000 to view the application.

## How to Run the Test Suite

The project uses minitest and power_assert for testing. To run the tests:
```bash
make test
```

## Linting

- Rubocop: Ensure your code adheres to the style guide.
- Slim Lint: Check your Slim templates for any issues.
```bash
make lint
```

## Deployment Instructions for Render

Go to the [Render instance of the project](https://dashboard.render.com/web/srv-cq6b3gks1f4s73dvcua0).

Click 'Manual Deploy' -> Select 'Deploy Latest Commit'

In case you need to deploy a new instance on Render read the instructions [here](https://docs.render.com/deploy-rails)


## How to Use the Project

#### Sign Up / Log In:
First, sign up for a new account or log in with an existing account.

#### Create a Post:
Navigate to the "New Post" section.
Choose a category from the list (pre-defined in the database) and provide a title and body for your post.
Submit the form to create your post.

#### View Posts:
All posts will be listed on the homepage. You can click on any post title to view the full content.

#### Comment on Posts:
Under each post, there is an option to leave a comment. You can also reply to existing comments to create a threaded discussion.

#### Like Posts:
If you like a post, simply click on the "Like" button to show your appreciation. You can undo this action by clicking the 'Like' button again.

#### Predefined Categories:
Categories are pre-created in the database through seeds. You can select any of these categories when creating a new post.

## Examples

Creating a Post:
  Example of creating a new post:

```ruby
Post.create(
  title: "My First Post",
  body: "This is the content of my first post.",
  category_id: 1,
  creator_id: 1
)
```

Adding a Comment:
  Example of adding a comment to a post:

```ruby
PostComment.create(
  content: "Great post!",
  post_id: 1,
  user_id: 1
)
```

Liking a Post:
  Example of liking a post:

```ruby
PostLike.create(
  post_id: 1,
  user_id: 1
)
```
