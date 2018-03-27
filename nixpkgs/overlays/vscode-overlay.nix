self: super:
{
  myVscode = super.vscode-with-extensions.override {

    # When the extension is already available in the default extensions set.
    vscodeExtensions = with self.vscode-extensions; [
      bbenoist.Nix
    ]

    # Concise version from the vscode market place when not available in the default set.
    ++ super.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "vscode-theme-onelight";
        publisher = "akamud";
        version = "2.1.0";
        sha256 = "1dx08r35bxvmas1ai02v9r25hxadmvm1fh50grq2r4fzqxjgxkqn";
      }

      {
        name = "latex-workshop";
        publisher = "James-Yu";
        version = "3.11.0";
        sha256 = "1h9fk8v2l457vxfffhv9p3bvg5rfh7ij301fbg40y1ffp9907g25";
      }

      {
        name = "code-spell-checker";
        publisher = "streetsidesoftware";
        version = "1.6.2";
        sha256 = "1lydxzms6f6g3msfmk2xrnr2yvf3av3ydq2n888wrnds3lkrrs56";
      }

      {
        name = "code-spell-checker-german";
        publisher = "streetsidesoftware";
        version = "0.1.2";
        sha256 = "02nkzd85i7kl6gldwq29gld82xrpcp5bzgmccymn4yiwgznancdq";
      }

      {
        name = "material-icon-theme";
        publisher = "PKief";
        version = "3.2.0";
        sha256 = "0gjivsfra1m1a4kdgpx795g9mp6h968r38kp6cj5h9mxnqn65zrf";
      }

      {
        name = "markdown-all-in-one";
        publisher = "yzhang";
        version = "0.11.2";
        sha256 = "1j4v89pnadf3q38nx3zknsyprallwh767v2b3y5gsfz87ar5b76s";
      }

      {
        name = "mdmath";
        publisher = "goessner";
        version = "2.1.0";
        sha256 = "1ylkzr3sv2q3p2hfr7lm6pibw1wcv55dil04mh13c892wb4vxgab";
      }

      {
        name = "language-haskell";
        publisher = "justusadam";
        version = "2.4.0";
        sha256 = "1xgxs0s3w5kf356nslf020svn2hr6dq216ndwjk23v6mqs1xfxgv";
      }

      {
        name = "vetur";
        publisher = "octref";
        version = "0.11.7";
        sha256 = "07w5p0nw7wclyni2f9xx5pdgdx06war41zrdjjdakrzpng7jy0lr";
      }
      
      {
        name = "flow-for-vscode";
        publisher = "flowtype";
        version = "0.7.3";
        sha256 = "06n9k44ir17jl3m4pb167xsz19sidys4vmsrx1d8w6bwvsijsh7i";
      }
    ];
  };
}