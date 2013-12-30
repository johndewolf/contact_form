require 'spec_helper'

describe Inquiry do
  it { should have_valid(:first_name).when('Bob') }
  it { should_not have_valid(:first_name).when(nil) }

  it { should have_valid(:last_name).when('Roberts') }
  it { should_not have_valid(:last_name).when(nil) }

  it { should have_valid(:email).when('br@gmail.com') }
  it { should_not have_valid(:email).when(nil) }

  it { should have_valid(:subject).when('test') }
  it { should_not have_valid(:subject).when(nil) }

  it { should have_valid(:description).when('does this work') }
  it { should_not have_valid(:description).when(nil) }

end
