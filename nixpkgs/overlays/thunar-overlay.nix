self: super:
{
  xfce.thunar = super.xfce.thunar.override {
    thunarPlugins = with self.xfce4-12; [
      tumbler # generate thumbnails  
    ];
  };
}