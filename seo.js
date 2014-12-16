Meteor.startup(function() {
  if(Meteor.isClient) {
    SEO.config({
      title: 'My Pregnancy Log',
      meta: {
        'description': 'Log your pregnant life.  HIPPA complient.'
      },
      og: {
        'image': Meteor.absoluteUrl('preglogLogo.svg')
      },
      ignore: {
        meta: ['fragment', 'viewport', 'msapplication-TileColor', 'msapplication-TileImage', 'msapplication-config'],
        link: ['stylesheet', 'apple-touch-icon', 'rel', 'shortcut icon', 'icon']
      }
    });
  }
});
