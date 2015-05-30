Why are these plugins separated?
--------------------------------
The plugins found in this 'concatenated' folder, have already been included in their minified form in
the [root]/js/plugins.js file. This is because they are global plugins, meaning they are used on every
page of the site and so can be included in the plugins.js file, which is loaded onto every page.

They are included again here for reference, and to make it easier if you need to develop the theme further.

Page-specific plugins, such as the mixitup plugin, ([root]/js/jquery.mixitup.min.js), are kept separate from the plugins.js file, as we only want to load them on the pages we need, (portfolio.html for mixitup). This will decrease page loading times as we want to keep the plugins.js as small as possible, and only include the core scripts that are required to run Alaska. We may also see JS conflicts if we included all our plugins but didn't initiate them effectively.

