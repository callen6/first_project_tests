MeandyoutubeApp::Application.routes.draw do
  match 'auth/:provider/callback'
end
