# Proyek Akhir Semester Kelompok E01

[![Build status](https://build.appcenter.ms/v0.1/apps/4b96352a-9823-4744-827d-2e3d72152038/branches/main/badge)](https://appcenter.ms)

[![Release](https://github.com/joshuanadeak/project-akhir-semester-pbp-e01/actions/workflows/release.yml/badge.svg?branch=main)](https://github.com/joshuanadeak/project-akhir-semester-pbp-e01/actions/workflows/release.yml)

[![Prerelease](https://github.com/joshuanadeak/project-akhir-semester-pbp-e01/actions/workflows/pre-release.yml/badge.svg?)](https://github.com/joshuanadeak/project-akhir-semester-pbp-e01/actions/workflows/pre-release.yml)

[![Pipeline Status Branch](https://github.com/joshuanadeak/project-akhir-semester-pbp-e01/actions/workflows/development.yml/badge.svg?branch=development)](https://github.com/joshuanadeak/project-akhir-semester-pbp-e01/actions/workflows/development.yml)

## Topic : Trade and Investment

## Investops

## 📌 Our Group's Members (E01) 📌
1. Christopher Nathanael Wijaya
2. Joshua Mihai Daniel Nadeak
3. Joan Isva Shanti Andrea
4. Muhammad Fahreza Azka Arafat
5. Alisya Andiny Alhabsyi
6. Ridho Mulia

## ✨ Link APK ✨
Aplikasi ini dapat didapat melalui [link berikut](https://install.appcenter.ms/orgs/project-akhir-semester-pbp-e01/apps/investops/distribution_groups/public).

## 📜 Backstory of The Application 📜
### Story
Modern economy is one of the most complex structure in human civilization, that have been formed from the early days of the humans until the era of digital technology. It puts everybody, you and me included, in it's structure of supply and demand. And because of this, the will of people to "bond" with it, by investing for instance, have been higher than ever. That's why we need a system that can provide reliable and accurate information about trading and investment. our target is that trading and investment can be accessed by everyone, from corporates to even a person that has never heard about it. That's why we created this app, that can provide all the main needs for trading and investment. This includes, learning about investing in stocks and crypto, understanding about companies and corporate, trivia to understand investing, and also a suggestion box for any new ideas.

### Impact
1. Educating people on how to understand investing and it's application;
2. Giving people investing experiences, so that they can have a hands on knowledge;
3. Connecting people with others in the trading community, to interact and enlight.

## 📝 Modules To Be Implemented 📝
### 1. Main Page (Flutter Module: `authenticate`) - Main and Home Page by Joshua, Login and Register by Christopher, and Logout by Azka
This module is the main page, which will include all the necessary requirement to do register, login, and other interesting stuff in the main web.

### 2. Investing in Crypto (Flutter Module: `crypto`) - Joshua Mihai Daniel Nadeak (2106635285)
This module will give a display of crypto available in the market. So, that it can be interacted by the user, to buy or to sold their crypto, which will impact the market of the crypto itself.
1. Admin : An admin can add and also delete stocks available in the market, which will also provide the user's options to buy and also sell their own crypto.
2. User : A user can interact with available crypto in the market and also the crypto that they own. This will give them the option to buy the available crypto and also sell their current crypto.

### 3. Investing in Stocks (Flutter Module: `stock`) - Christopher Nathanael Wijaya (2106630044)
This module will display the watchlists of stocks available in the market. It also provide user's action to buy and sold their current stock. 
1. Admin : An admin can add and delete stocks and its properties to the watchlist that visible to the user.
2. User : A user can interact with available stocks and their current stocks. User can buy some stocks that available at the watchlists and sold some stocks they have.

### 4. Registration For Companies and Corporates (Flutter Module: `registration`) - Ridho Mulia (2006597866)
This module will provide a registration page for companies and corporates to register themselves as special users on the site. 
The roles in this module are as follows:
1. Admin : An admin can see list of companies that have registered on the website.
2. User : A user can register their company as an entity on the site. User will provide data about the company such as the name of the company and estimation about the price of stock of the company.

### 5. E-Learning on Trading (Flutter Module: `elearning`) - Alisya Andiny Alhabsyi (2106706281)
This module will contain articles and e-book links that users can read to gain insight about trading. There will be a discussion forum at the bottom that can be used to conduct questions and answers with other users. The roles in this feature are as follows:
1. Admin : An admin can see and delete the questions and answers from users on the discussion forum.
2. User : A user can reply to the discussion forum. User will have a discussion by asking or answering questions about the articles.

### 6. Trivia on Trading (Flutter Module: `quiz`) - Joan Isva Shanti Andrea (2106707712)
This module will be a feature where users can test and improve their knowledge on trading. There will be trivia questions available for the users to answers. When users finished answering, they can submit their answer and get their feedback. The roles in this feature are as follows:
1. Admin : An admin can see the results of the users who have submitted their answers.
2. User : A user can answer the questions available, submit their answers, and get their feedback score. The feedback score would be displayed after finishing the trivia. 
 
### 7. Suggestion Box (Flutter Module: `suggestionbox`) - Muhammad Fahreza Azka Arafat (2106752331)
This app explains itself in it's name, it's a suggestion box where users can give feedback on the app via a form. When the form is successfully submitted, there will be a popup modal saying thank you to the user for giving the feedback. The roles in this app are the following:
1. Admin : An admin can reply to the feedback given by the user and also delete it. This reply will then be displayed in cards along with the feedback in question.
2. User : A user can submit a form containing their feedback to this app, this feedback will then be displayed in cards. If it is not replied by the admin yet, the response field will be empty.

## 👥 Backstory of The Application 👥
🔒 User yang Belum Login 🔒
Dapat mengakses ke semua modul, hanya saja tidak bisa melakukan transaksi pembelian dan penjualan pada stock dan crypto, lalu quiz juga tidak bisa lakukan.
🔓 User yang Sudah Login 🔓
Memiliki semua access terhadap fitur yang belum login seperti seperti discussion forum, membagikan postingan, serta berkomentar dan bereaksi terhadap postingan user lainnya.
👑 Super User 👑
Memiliki access ke berbagai fitur serta privilege dalam hal membuat, membaca, memperbarui, serta menghapus riwayat user maupun konten yang tersedia

## 🔧 Alur Pengintegrasian dengan Web Service Proyek Tengah Semester 🔧
Secara konsep, ini dapat dilakukan dengan FutureBuilder yang berperan sebagai widget yang dapat membangun dirinya sendiri sesuai dengan status pada future sebagai wujud komputasi asinkronus. Nantinya akan ditaruh `var url` herokuapp project tengah semester dan dilakukan http.get (tentunya dengan diambil dulu modulnya). Lalu akan disesuaikan dengan model yang terkait. Karena konsep aplikasi Investops Mobile serupa dengan versi web-nya, maka kami akan memanfaatkan _endpoint_ yang kami sudah buat pada PTS sebelumnya untuk membawa fitur-fitur pada Investops Web kepada versi _mobile_-nya. Pada dasarnya, aplikasi mobile kami akan mengakses _endpoint_ pada Django, di mana _endpoint_ yang sudah dibuat akan mengembalikan _response_ JSON, sehingga memudahkan pengolahan data di Flutter.
Secara tahapan, ini dapat dilakukan dengan langkah sebagai berikut:
1. Menambahkan dependency http ke dalam aplikasi Investops Mobile.
2. Membuat model di source code aplikasi Investops Mobile yang akan berguna untuk proses parsing response JSON.
3. Membuat berbagai request kepada endpoint PTS untuk mengakses dan menambah data, sehingga fitur-fitur pada versi web juga dapat diakses di versi mobile Investops.
4. Memanfaatkan widget FutureBuilder untuk menampilkan response GET request dari aplikasi Investops Mobile.


