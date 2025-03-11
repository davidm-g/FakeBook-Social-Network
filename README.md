# Lbaw24021 - FakeBook <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/html5/html5-original.svg" title="HTML" alt="HTML Logo" width="55" height="55" align="right" />&nbsp; <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/bootstrap/bootstrap-original.svg" title="Boostrap" alt="Boostrap Logo" width="55" height="55" align="right" />&nbsp; <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/javascript/javascript-original.svg" title="JavaScript" alt="JavaScript Logo" width="55" height="55" align="right" />&nbsp; <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/postgresql/postgresql-original.svg"  title="PostGresSQL" alt="PostGresSQL Logo" width="55" height="55" align="right" />&nbsp; <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/laravel/laravel-original.svg" title="Laravel" alt="Laravel Logo" width="55" height="55" align="right" />&nbsp; 

#### Project done in collaboration with:  
[Tomás Marques](https://github.com/Torpedoooo)  
[Afonso Domingues](https://github.com/AfonsoDomingues17)        
[João Lamas](https://github.com/jomilamas)

## Grade: 92/100

## Description

FakeBook is a sophisticated information system with a web interface, designed to connect individuals globally. It enables users to share content in text or multimedia formats through a vertically scrolling feed, fostering interactions via comments, likes, and messages. The platform emphasizes user privacy with robust authentication mechanisms and customizable profile settings, allowing users to choose between public or private profiles. Public profiles are accessible to all users, while private content is restricted to approved followers. To ensure efficient content discovery, FakeBook supports advanced search functionalities for posts, groups, and user profiles.
The system defines distinct user roles, including Normal Users, Influencers, and Administrators. Influencers, identified by their large followings, gain access to analytics for monitoring content performance, while Administrators oversee platform integrity by managing user accounts, moderating content, and handling reports. Features like group creation, filtering by attributes, and support for direct communication enhance the user experience. With tools for post and profile management, as well as measures to address inappropriate behavior, FakeBook is designed to provide a secure, user-focused environment for global connectivity and interaction.

## Visuals

Main Page

![](/imgs/main_page.png)


## Installation

- Clone the repo to your machine

        git clone https://github.com/davidm-g/FakeBook-Social-Network.git
        cd FakeBook-Social-Network/
        composer update

- Open Docker Desktop

        docker compose up -d

- Set up server database on pgAdmin 

        cp .env.fakebook .env
        php artisan db:seed
        php artisan migrate
        php artisan storage:link
        php artisan serve

## Usage

### Credentials 

#### Administration Credentials

> Administration URL: [http://localhost:8001/admin](http://localhost:8001/admin)

| Email | Password |
|-------|----------|
| admin@gmail.com | 1234 |

#### User Credentials

| Type | Email | Password |
|------|-------|----------|
| Basic account | userexample@gmail.com | 1234 |
| Influencer account | influencer@gmail.com | 1234 |

#### Mailtrap Credentials

| Email | Password |
|-------|----------|
| lbaw2421@gmail.com | 2421LBAW! |

### Example 1: Creating a New Post

To create a new post, navigate to the main page and click on the "Create Post" button. Fill in the post content and click "Create".

**Expected Output:**
- The new post will appear at the top of your feed.
- Other users can like or comment on your post.

![](/imgs/create_post.png)

### Example 2: Searching for Users

To search for users, use the search bar at the top of the page. Enter the name of the user you are looking for and press "Enter".

**Expected Output:**
- A list of users matching your search criteria will be displayed.
- You can click on a user to view their profile.

![](/imgs/search.png)

### Example 3: Creating a Group

To create a group, navigate to the "Conversations" section and click on the "Create Group" button. Fill in the group details and click "Create".

**Expected Output:**
- The new group will be created and listed in the "Conversations" section.
- You can add users to your group.

![](/imgs/create_group.png)

### Example 4: Viewing Analytics (For Influencers)

If you are an influencer, you can view analytics by navigating to the "Analytics" section in your profile.

**Expected Output:**
- You will see charts and graphs showing information about your followers
- You can filter the followers by country and other criteria.

![](/imgs/analytics.png)

## Support

If you have any doubts contact us through the emails below.

## Authors and acknowledgment

- Afonso Domingues up202207313@up.pt
- David Gonçalves up202208795@up.pt
- João Lamas up202208948@up.pt
- Tomás Marques up202206667@up.pt

## Project status

Completed

---
Made by David Gonçalves | davidmgoncalves.pt@gmail.com  
<div id="badge"> <a href="https://www.linkedin.com/in/davidm-g"/> <img src="https://img.shields.io/badge/LinkedIn-blue?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn Badge"/>&nbsp;