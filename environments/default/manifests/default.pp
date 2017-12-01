include apache
notify {
    'my_message': message => lookup('my_message'),
}
