package Finance::Intuit::Aggcat::Client;

use sugar;
use Moose;

has client  => is => 'ro', required => 1, handles => [qw(get post put delete)];

# TODO map xml responses to usable objects

method get_institutions () {
    $self->get('/institutions');
}

method get_institution_details ($institution_id) {
    $self->get('/institutions/' . $institution_id);
}

method discover_and_add_accounts ($institution_id, $credentials, $mfa_answer) {
    $self->post('/institutions/' . $institution_id . '/logins',
        { "headers" => "here" }, { "postdata" => "here" });
# TODO handle 401 for mfa
# TODO create credentials class
# TODO create mfa response class
# TODO create mfa challenge class
}

method get_account_transactions ($account_id, $start_date, $end_date) {
    $self->get('/accounts/' . $account_id . '?' . 'txnStartDate=' . $start_date . '&' . 'txnEndDate=' . $end_date);
    # first two are required, third is optional
}

method get_account ($account_id) {
    $self->get('/accounts/' . $account_id);
}

method get_customer_accounts () {
    $self->get('/accounts');
}

method get_login_accounts ($login_id) {
    $self->get('/logins/' . $login_id . '/accounts');
}

method get_investment_positions ($account_id) {
    $self->get('/accounts/' . $account_id . '/positions');
}

method update_account_type ($account_id, $type, $value) {
    $self->post('/accounts/' . $account_id, { $type => $value });
    # TODO post data should be xml
}

method update_institution_login ($login_id, $credentials, $mfa_answer) {
    $self->put('/logins/' . $login_id . '?refresh=true');
    # TODO put data
}

method delete_account ($account_id) {
    $self->delete('/accounts/' . $account_id);
}

method delete_customer {
    $self->delete('/customers');
}

# unimplemented batch api calls
method list_files {
    ...
}

method get_file_data {
    ...
}

method delete_file {
    ...
}

1;

