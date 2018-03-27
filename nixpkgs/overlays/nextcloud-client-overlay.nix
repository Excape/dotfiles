self: super:
{
  nextcloud-client = super.nextcloud-client.override {
    withGnomeKeyring = true;
    libgnome-keyring = self.gnome3.libgnome-keyring;
  };
}