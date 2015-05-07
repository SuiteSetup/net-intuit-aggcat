package Finance::Intuit::Aggcat::UserAgent;

use sugar;
use Moose;

has config      => is => 'ro', required => 1;
has customer_id => is => 'ro', required => 1;

method get {

}

method post {

}

method put {

}

method delete {

}

# private
has _ua => is => 'ro', lazy => 1, builder => '_build_ua';

method _build_ua {
    # customize
    LWP::UserAgent->new;
}

method _request {
    # oauth/saml goop goes here
}

# looks like we can use OAuth::Lite::Token and ::Consumer here
has oauth_client    => is => 'ro', lazy => 1, builder => '_build_oauth_client';
has oauth_consumer  => is => 'ro', lazy => 1, builder => '_build_oauth_consumer';
has oauth_token     => is => 'ro', lazy => 1, builder => '_build_oauth_token', clearer => '_clear_oauth_token';
has oauth_token_expires => is => 'ro', lazy => 1, builder => '_build_oauth_token_expires', clearer => 'clear_oauth_token_expiers';

method saml_message () {

}

1;

