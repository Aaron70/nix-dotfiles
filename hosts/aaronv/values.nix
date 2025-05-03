{
  users = rec {
    default = {
      username = "aaronv";
      description = "Aaron Vargas";
      email = "aarongeovanny70@gmail.com";
    };

    list = [
      default
      {
        username = "test";
        description = "My test user";
        email = "";
      }
    ];
  };
}
