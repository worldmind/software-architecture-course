my $app = sub {
     my $env = shift;
     return [
             '200',
             [ 'Content-Type' => 'text/html' ],
             [ "<h1>Hello Strange World</h1>" ],
     ];
};
