# encoding: utf-8

require 'spec_helper'

module Punchblock
  class Event
    describe Unjoined do
      it 'registers itself' do
        RayoNode.class_from_registration(:unjoined, 'urn:xmpp:rayo:1').should be == Unjoined
      end

      describe "from a stanza" do
        let(:stanza) { '<unjoined xmlns="urn:xmpp:rayo:1" call-id="b" mixer-name="m" />' }

        subject { RayoNode.import parse_stanza(stanza).root, '9f00061', '1' }

        it { should be_instance_of Unjoined }

        it_should_behave_like 'event'

        its(:call_id)     { should be == 'b' }
        its(:mixer_name)  { should be == 'm' }
        its(:xmlns)       { should be == 'urn:xmpp:rayo:1' }
      end

      describe "when setting options in initializer" do
        subject { Unjoined.new :call_id => 'abc123', :mixer_name => 'blah' }

        its(:call_id)     { should be == 'abc123' }
        its(:mixer_name)  { should be == 'blah' }
      end
    end
  end
end # Punchblock
