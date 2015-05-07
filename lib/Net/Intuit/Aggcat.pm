package Finance::Intuit::Aggcat;

use sugar;
use Moose;

has issuer_id        => is => 'ro', required => 1;
has consumer_key     => is => 'ro', required => 1;
has consumer_secret  => is => 'ro', required => 1;
has certificate_path => is => 'ro', required => 1;
has open_timeout     => is => 'ro', default  => 15;
has read_timeout     => is => 'ro', default  => 120;
has verbose          => is => 'ro', default  => 0;

method for_customer ($customer_id) {

    my $client   = Finance::Intuit::Aggcat::Client->new(config => $self, customer_id => $customer_id);
    my $customer = Finance::Intuit::Aggcat::Customer->new( client => $client );
    return $customer;
}

1;

__END__

$customer = Aggcat->new(%config)->for_customer($some_customer_id)
@insts = $customer->get_institutions

usage in SuiteSetup:

$customer = $container->service("Intuit-Aggcat")->for_customer( $self->account->id )
$customer->get_accounts



API docs: https://developer.intuit.com/docs/0020_customeraccountdata/customer_account_data_api/0020_api_documentation
See https://github.com/cloocher/aggcat for implementation hints

