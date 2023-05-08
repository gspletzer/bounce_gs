# BounceGs

## Check it out:

To create a local copy:

- Clone BounceGs to your machine.
  - `git clone <git-repository-link>`
- Navigate into the directory with
  - `cd bounce_gs`

To start your Phoenix server:

- Run `mix setup` to install and setup dependencies
- Start Phoenix endpoint with `mix phx.server`

To test in browser:

- Visit [`localhost:4000`](http://localhost:4000)
- Things to try:
  - `Add` and `subtract` bags from the cart
  - Submit cart for checkout
    - Credit card number input requires 16 numeric characters to `submit`.
    - All input fields must contain a value to `submit`.
    - If `submit` button changes to red and reads `retry` keep clicking until you reach the `/success` view. Values of input field will persist from `submit` to `retry` views. It does not persist after `/success` is reached.
    - If you get `/success` on the first try and wish to try again to attempt a retry response, simply use the back arrow or change path in browser to `localhost:4000`; both options will reset the state of the page to a new, empty cart. You will have to add input values again.

To run tests:

- `mix test.interactive` will allow you to run tests and will rerun tests when you save changes. This option also allows you to designate which files to rerun after initial run. You can learn more abou those options by entering `?` in the terminal once `mix test.interactive` is running.
- `mix test` will run all the tests one time.
- Currently there are only unit tests running.

## Keep in Mind:

- This is not a fully developed application. It is missing validation, telemetry, integration + end-to-end testing, database (initialized, but no tables added yet), and a functional payment API.

- Several files contain notes with explanation or TODOs to assist with code readability in underdeveloped features. (Ex. `BounceGs.Checkout` and `BounceGs.CheckoutTest`)

- `BounceGs.Checkout.Transaction` is included to show how I might handle writing to the database, but is not currently integrated into the application.

- If telemetry was utilized, I would primarily track submits for easier error resolution and tracking metrics for success versus failure.

- If a database was implemented this is approximately the shape I'd consider.

  ![alttext](https://github.com/gspletzer/bounce_gs/assets/images/bounce_gs_database.png)

## Additional Information:

- If you elect to contribute to the project, please add your changes to a separate branch, then open a pull request for Repo Owner review.

- If you have questions, you can reach me at `gracespletzer05@gmail.com`
