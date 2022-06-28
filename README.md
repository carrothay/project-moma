
#  MOMA

> Movie and drama searching/booking/review web service

MOMA stands for MOvie and draMA.
The website allows users to get information of movies and dramas, book movie tickets and write reviews.

##  1. Intro

###  1. Purpose/Motive
- Increment of online-only media consumption
- Diversification of OTT(Over The Top, streaming service) platforms
- Dispersal of movie booking websites

###  2. Why MOMA
- Offers a wide selection of media genres and real reviews from users
- Provides a simple and easy web page of various contents from multiple OTT platforms


###  3. Expected Outcome
- Builds a healthy online community through sharing practical reviews
- Improves connectivity efficiency by providing direct OTT url for each content
- Improves user convenience with offering direct movie booking service

###  4. Project timescale / team members

- 16 March 2022 ~ 19 April 2022
- 4 members

##  2. Techs used

|Development Environment|Techs/Tool|
|:---:|:---:|
| OS | MS Window 10 |
| Database | Oracle 11g xe |
| Web Application Server | Apache Tomcat v9.0 |
| IDE | Eclipse |
| Language | Java/JSP, JavaScript/jQuery, HTML5/CSS3 |
| Web Framework | MyBatis |

##  3.ERD

![](https://github.com/carrothay/project-moma/blob/main/images/erd.jpg)

##  4. Main Functions

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

<!--

## 5. Demo pages

## 6. Refactoring

## Authors

-->
