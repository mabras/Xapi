# encoding: utf-8
require 'spec_helper'

describe Xapi::Statement do
  include Helpers

  it 'should serialize and deserialize' do
    targets = []
    activity = Xapi::Activity.new
    activity.id = 'http://example.com/activity'
    targets << activity
    targets << get_agent('Target', 'mbox', 'mailto:target@example.com')
    ref = Xapi::StatementRef.new
    ref.id = SecureRandom.uuid
    targets << ref

    sub = Xapi::SubStatement.new
    sub.actor = get_agent('Sub', 'mbox', 'mailto:sub@example.com')
    verb = Xapi::Verb.new
    verb.id = 'http://example.com/verb'
    sub.verb = verb
    activity = Xapi::Activity.new
    activity.id = 'http://example.com/sub-activity'
    sub.object = activity
    targets << sub

    statement = Xapi::Statement.new
    statement.actor = get_agent('Joe', 'mbox', 'mailto:joe@example.com')
    attachment = Xapi::Attachment.new
    attachment.sha2 = '123'
    statement.attachments = [attachment]

    statement.authority = get_agent('Authority', 'mbox', 'mailto:authority@example.com')

    context = Xapi::Context.new
    context.language = 'en-US'
    statement.context = context

    statement.id = SecureRandom.uuid

    result = Xapi::Result.new
    result.completion = true
    statement.result = result

    statement.stored = Time.now
    statement.timestamp = Time.now

    verb = Xapi::Verb.new
    verb.id = 'http://example.com/verb'
    statement.verb = verb

    targets.each do |target|
      statement.object = target
      assert_serialize_and_deserialize(statement)
    end
  end

  it 'got stamped' do
    statement = Xapi::Statement.new
    statement.stamp
    expect(statement.id).not_to eq nil
    expect(statement.id).to be_a String
    expect(statement.timestamp).not_to eq nil
    expect(statement.timestamp).to be_a Time

    timestamp = Time.now
    id = SecureRandom.uuid
    statement = Xapi::Statement.new
    statement.stamp(id: id, timestamp: timestamp)
    expect(statement.id).to eq(id)
    expect(statement.timestamp).to eq(timestamp)
  end
end
