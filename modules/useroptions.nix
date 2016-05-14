{ lib, ... }:

with lib;
{
  options.users.users = mkOption {
    options = singleton {
      email = mkOption {
        type = types.nullOr types.string;
        description = "The user's email address";
      };
    };
  };
}
