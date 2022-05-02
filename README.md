# Final-capstone-backend

An api with end points to create/view/delete/update House and Booking Entities.


# Link for the Front-End Repository
[Click Me!](https://github.com/ShoiraTa/Vacayhome-front-end)

# Live link for API

 [Click Me!](https://vacayhome-api.herokuapp.com/api-docs/index.html)
## Built With

- Ruby version 3.1.1
- RoR version 7
## Getting Started

The API will receive POST requests to create Houses and Bookings and GET requests to view Houses and Bookings.
The base URL is: https://vacayhome-api.herokuapp.com

If you want to view Houses you can call this endpoint:

/api/v1/houses

To do the same but with bookings call this endpoint:

/api/v1/bookings

Both endpoints will return a JSON response with the following format:

```
For Houses:
{
  "id":1,
  "name":"Cool House",
  "price":"100.0",
  "description":"This is a cool House",
  "country":"US",
  "city":"Los Angeles",
  "address":"100 cool street",
  "property_type":"house",
  "image_url":"https://exampleimage.com",
  "created_at":"2022-04-05T13:13:11.814Z",
  "updated_at":"2022-04-05T13:13:11.814Z"
}

For Bookings:
{
  "id":1,
  "date":"2022-04-06",
  "created_at":"2022-04-06T17:37:29.310Z",
  "updated_at":"2022-04-06T17:37:29.310Z",
  "user_id":1,
  "house_id":1
}
```

You can view a specific House by calling this endpoint:

/api/v1/houses/:id

Same goes for Booking:

/api/v1/bookings/:id

**If you need further information about the endpoints you can view the documentation navigating to `/api-docs`.
Or you can just click this [link](https://vacayhome-api.herokuapp.com/api-docs/index.html)**

If you prefer to clone the project locally, you can also get to the docs by navigating to http://`domain`:`port`/api-docs. Where `domain` is the domain of your server and `port` is the port of your server.
For example, if your server is running on port 3000, you can navigate to http://localhost:3000/api-docs.
There you will see a list of all endpoints and their descriptions.

**The project comes shipped with linters config for ruby, so ensure you have Rubocop installed in your local environment**

- **Ensure you have postgresql, nodejs, ruby and rails set up on your machine**

- **To get a local copy of the repository please run the following commands on your terminal:**
`$ git clone https://github.com/Lordkaito/final-capstone-backend.git`


- **$ run `bundle install` to couple all dependacies in gem files**


- **$ run `rails s` to start rails server**

- **$ browse `http://<domain>:<port>/api-docs` to view swagger api documentations and test end points**
## Database creation

Run rails db:create db:migrate db:seed



## Kanban Board

The Kanban Board for both front-end and back-end of the project can me accessed [Here](https://github.com/ShoiraTa/Vacayhome-backend/projects/1)


## Authors

Our team is composed of:
👤 **You-Wei (Adam) Chang** 
- GitHub: [@adamteddychang](https://github.com/adamteddychang)
- Twitter: [@AdamChang3](https://twitter.com/AdamChang3) 
- LinkedIn: [You-Wei(Adam) Chang](https://www.linkedin.com/in/adamteddychang/)

👤 **Shoira**

- GitHub: [@shoirata](https://github.com/shoirata)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/shoira-tashpulatova-bab4a7122/)

👤 **Ugboaja-Uchechi**

- [GitHub](https://github.com/Ugboaja-Uchechi)
- [LinkedIn](https://www.linkedin.com/in/stephanie-ugboaja-930a2a216/)

👤 **Simo Nkosi**

- GitHub: [@KDlamini](https://github.com/KDlamini)
- Twitter: [@RealSimoNkosi](https://twitter.com/RealSimoNkosi)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/simo-nkosi-418523180/)








## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- [Murat Korkmaz](https://www.behance.net/muratk) for the awesome [design](https://www.behance.net/gallery/26425031/Vespa-Responsive-Redesign) for our front-end.
## 📝 License

- This project is [MIT](./LICENSE) licensed.


