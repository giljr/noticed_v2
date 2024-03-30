## Noticed V2
Hi, this is all about [Noticed v2](https://github.com/excid3/noticed) , a remarkable gem developed by [Chris Oliver](https://github.com/excid3)!
This is Working Code! :tada: :rocket:

In case you’re not yet familiar, Noticed V2 is a remarkable gem developed by Chris Oliver. It simplifies the transmission of notifications of various types through different channels to diverse recipients within your application.

You're more than welcome to visit my Web Pages: 

 [Jungletronics](https://medium.com/jungletronics) (Arduino, RPi, PIC, Eagle, Blender, Unity3D, Pixy, and more) 
 [KidsTronics](https://medium.com/kidstronics) (MIT App Inventor, LEGO, Arduino For Kids, and more)
 

Here, the emphasy lies on:
```
Learning By Doing!
``` 
### Project Inventory Leading Up to Version 8 :ant:

01# **[Quick Start](https://medium.com/jungletronics/a-rails-blog-in-vs-code-quick-start-5c3173191a64)** — **Part I** — Get started with a very simple rails 7 frame;

02# **[Styling](https://medium.com/jungletronics/a-rails-blog-in-vs-code-quick-start-ea2124ca2de0#85e2)** — **Part II** — Learn Bootstrap in a simply way;


03# **[Create Posts](https://medium.com/jungletronics/a-rails-blog-in-vs-code-create-posts-caf527a932e4)** — **Part III** — Learn how scaffold works; 

04# **[Posts Tips&Tricks](https://medium.com/jungletronics/a-rails-blog-in-vs-code-posts-tips-tricks-770402c76556)** — **Part IV** — Learn how make a custom migration;

05# **[Devise](https://medium.com/jungletronics/a-rails-blog-in-vs-code-devise-47532d9f5e0f)** — **Part V** — Learn how to use the Devise;

06# **[Add Comments to Post](https://medium.com/jungletronics/rails-blog-in-vs-code-post-comments-1df7ecf1edcb)**  — **Part VI** — Set up Action Text;

07# **[Using Stimulus](https://medium.com/jungletronics/rails-blog-in-vs-code-using-stimulus-9d21f7a910f1)** — **Part VII** — Learn about Hotwire Turbo Family 

08# **[Noticed V1](https://medium.com/jungletronics/rails-blog-in-vs-code-noticed-v1-78f67a002f27)**  — **Part VIII** — Learn Noticed v1- An alert system gem developed by [Chris Oliver](https://github.com/excid3);

09# **[Noticed V2](https://medium.com/jungletronics/rails-blog-in-vs-code-noticed-v2-7ab37f9d5cc4)** — **Part IX**
 — Get Noticed v2 running smoothly on our blog.


## Screenshots


```
You won't find a graphic like this anywhere on the internet
```
![Noticed v2](https://miro.medium.com/v2/resize:fit:1400/format:webp/1*NaultE0FbjmWqCRhIOEo6w.png)

Download the [PNG](https://drive.google.com/file/d/1Wt21u-Kelk3PCVeSF9ckGIwkr2J5EL67/view)
or [SVG](https://drive.google.com/file/d/1x8QgbI96EoeD-NxaGoE1fr-iZR5v1BHm/view?usp=drive_link) Images from my drive.

```
This graphic illustrates all the relationships within 
the business and the Noticed v2 models. 

Here are some key points about the graphics I'd like to discuss:

1. Business Tables Relationships:

Users have many posts, and each post belongs to one user.
Posts have many comments, and each comment belongs to one post.
Users also have many comments, and each comment belongs to one user.

2. The Noticed system:

comprises two tables: noticed_notifications table: Which tracks recipients and whether they've seen or read notifications.
noticed_events table: Stores events and comments about what happened, including the type of comments (e.g., bug notes, release notes, improvements notes).
The polymorphic attribute is set to true, allowing a model to belong to multiple parent models. For instance, the Notification model can be associated with various entities like User, Post, Admin or Comment dynamically.

3. Relationships and Glue Logic:

In the noticed_events table, events belong to records, and in noticed_notifications, records belong to events, creating an augmented relationship. Recipients, defined in the Users table, are linked to notifications, serving as the glue logic for our business logic framework.

4. Notification Handling:

There are two types of notifications: one directly associated with users and another through delegations to posts.
The Comments table has many 'notification_mentions', connecting to the Noticed library through 'has_noticed_notifications' linked with the Noticed::Event model. The Posts table also has many 'notification_mentions', linked through user delegation.

5. MVC Architecture:

The controller, represented by 'application_controller.rb', always sets notifications if the user is authenticated via 'Devise'.
The view, represented by '_notifications.html.erb' file, presents the UI interface (a simple Bootstrap bell badge) and renders the system encapsulating the business logic.

6. Olive's Framework:

We should further investigate Olive's framework, though I currently lack specific details. Understanding how Olive's framework integrates with or enhances our existing system could offer valuable insights into our overall architecture and functionality. Let's explore how Olive's framework interacts with or enhances our current setup.

That summarizes the key aspects of the observed graphics.

If there's more you'd like to discuss about Olive's framework or any other aspect, feel free to share!
```
## Installation

Clone my-project in linux terminal:

```bash
git clone -b rails_blog_v7 git@github.com:giljr/rails_blog_demo.git
cd rails_blog_v7
```
Go To vscode:
```bash
code .
```
Here are Git Commands:
```
git checkout -b use_noticed_gem_2
bundle add noticed -v 2.2
bundle install
rails noticed:install:migrations
bundle install
rails db:migrate
rails g noticed:notifier CommentNotifier
rails s
rails c
rails s
rails db:drop
rails db:migrate
rails s
git status
git add -A
git commit -m ":lipstick: Upload to Noticed v2"
git push
git push --set-upstream origin use_noticed_gem_2
```
Go To your GIT REPO and Merge the Request:
```
git checkout master
git status
git fetch
git pull
rails s
```
Run and hope for the best!
## Run Locally


#### Tutorial

Rails Blog In VS Code - **Noticed V2 - 
How To Create A Blog in VS Code** — [Part IX](https://medium.com/jungletronics/rails-blog-in-vs-code-noticed-v2-7ab37f9d5cc4
)— Notifications for your Ruby on Rails app — RailsSeries#Episode 11


## Acknowledgements

 - [Chris Oliver](https://github.com/excid3) Rails Luminary. Building GoRails.com, JumpstartRails.com, Hatchbox.io, and host of the Remote Ruby Podcast


## Authors

 - [@giljr](https://www.linkedin.com/in/giljrx/)
## Contributing

 - [@jeovan.farias](https://www.linkedin.com/in/jeovan-f-6283b8145/)

 - [@bruno.vichinheski](https://www.linkedin.com/in/brunovichinheski/)
 


Contributions are always welcome!

See `contributing.md` for ways to get started.

Please adhere to this project's `code of conduct`.


## License

[MIT](https://choosealicense.com/licenses/mit/)

