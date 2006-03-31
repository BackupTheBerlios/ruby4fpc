Program test_000_basic;
Uses Ruby;

Begin
  ruby_init();
  ruby_script('embedded');
  rb_eval_string('20 * 20');
  writeln('You should not see this unless there is an error');
end.