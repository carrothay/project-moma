
#  MOMA

> Movie and drama searching/booking/review web service

MOMA stands for MOvie and draMA.
The website allows users to get information of movies and dramas, book movie tickets and write reviews.

##  1. Intro

###  1.1. Purpose/Motive
- Increment of online-only media consumption
- Diversification of OTT(Over The Top, streaming service) platforms
- Dispersal of movie booking websites

###  1.2. Why MOMA
- Offers a wide selection of media genres and real reviews from users
- Provides a simple and easy web page of various contents from multiple OTT platforms


###  1.3. Expected Outcome
- Builds a healthy online community through sharing practical reviews
- Improves connectivity efficiency by providing direct OTT url for each content
- Improves user convenience with offering direct movie booking service

###  1.4. Project Timescale / Team Members

- 16 March 2022 ~ 19 April 2022
- 4 members (Back-end)

##  2. Techs Used

|Development Environment|Techs/Tool|
|:---:|:---:|
| OS | MS Window 10 |
| Database | Oracle 11g xe |
| Web Application Server | Apache Tomcat v9.0 |
| IDE | Eclipse |
| Language | Java/JSP, JavaScript/jQuery, HTML5/CSS3 |
| Web Framework | MyBatis |

##  3. ERD

![](https://github.com/carrothay/project-moma/blob/main/images/erd.jpg)

##  4. Main Functions

- Main page
  - Top 10 contents by view count: Carousel function
- Content page
  - Includes director, actors, genre, running time etc
  - Includes review list and star rates
- Booking movie tickets / OTT link
  - Activates booking button if the movie is showing now
  - Includes OTT buttons (Netflix/Watcha/Tving) that directly link to streaming platforms
- Search function
  - Allows to choose multiple genres and search result will appear sorted by registered number
- Admin Forum page
  - Designed by grid function and responsive css
  - Recommends media and introduces synopsis
  - Allows users to write comment on the post
- My page
  - Bookmark list
  - My reservation list
  - My review list
  - My Info
- Admin page
  - Member list
  - Contents list
  - Forum list
  - Review list
  
<details>

<summary><b>Functional Description</b></summary>

<div markdown="1">

###  4.1 Main flow

![](https://github.com/carrothay/project-moma/blob/main/images/flow.png)

JSP MVC model 2

1: Client sends a request and it comes to **Web Server**.

2: Web server identifies requested JSP page and send it to **Web Container**.

3, 4: **Servlet(Controller)** receives input and commands to **Model** to process and return the data through DB Server. Controller will then connect the data to **View**. 

5: Web Container sends the web page to Web Server.

6: Web Server sends the web page to the client.

###  4.2 Controller

###  4.3 Menu Tree

![](https://github.com/carrothay/project-moma/blob/main/images/menutree.jpg)

</div>
</details>

## 5. Screenshots of web pages
Main page<br>
<img src="https://github.com/carrothay/project-moma/blob/main/images/moma1.png" width="80%"><br>
***
Genre Filter<br>
<img src="https://github.com/carrothay/project-moma/blob/main/images/moma2.png" width="80%"><br>
***
Movie list<br>
<img src="https://github.com/carrothay/project-moma/blob/main/images/moma3.png"><br>
***
Content detail page<br>
<img src="https://github.com/carrothay/project-moma/blob/main/images/moma6.png" width="80%"><br>
***
Review list<br>
![](https://github.com/carrothay/project-moma/blob/main/images/moma5.png)<br>
***
Booking movie button<br>
![](https://github.com/carrothay/project-moma/blob/main/images/moma4.png)<br>
***
OTT link button<br>
![](https://github.com/carrothay/project-moma/blob/main/images/moma7.png)<br>
***
Admin forum<br>
<img src="https://github.com/carrothay/project-moma/blob/main/images/moma8.png" width="80%"><br>
***
My page - my bookings<br>
![](https://github.com/carrothay/project-moma/blob/main/images/moma9.png)<br>
***
Admin page - content list<br>
<img src="https://github.com/carrothay/project-moma/blob/main/images/moma10.png" width="80%"><br>
***
Admin page - forum post list<br>
<img src="https://github.com/carrothay/project-moma/blob/main/images/moma11.png" width="80%"><br>


<!--

## 6. Refactoring

## Authors

-->
