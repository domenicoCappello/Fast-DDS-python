# Copyright 2021 Proyectos y Sistemas de Mantenimiento SL (eProsima).
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
"""
Script to test Fast DDS python bindings
"""
import argparse
import threading

import fastdds_wrapper
import HelloWorld

DESCRIPTION = """Script to test Fast DDS python bindings"""
USAGE = ('python3 test.py -p publisher|subscriber [-d domainID -m machineID]')

class Reader():
  def __init__(self, domain):
    factory = fastdds_wrapper.DomainParticipantFactory.get_instance()
    self.participant_qos = fastdds_wrapper.DomainParticipantQos()
    factory.get_default_participant_qos(self.participant_qos)
    self.participant = factory.create_participant(domain, self.participant_qos)

    self.topic_data_type = HelloWorld.HelloWorldPubSubType()
    self.topic_data_type.setName("HelloWorldDataType")
    self.type_support = fastdds_wrapper.TypeSupport(self.topic_data_type)
    self.participant.register_type(self.type_support)

    self.topic_qos = fastdds_wrapper.TopicQos()
    self.participant.get_default_topic_qos(self.topic_qos)
    self.topic = self.participant.create_topic("myTopic", self.topic_data_type.getName(), self.topic_qos)

    self.subscriber_qos = fastdds_wrapper.SubscriberQos()
    self.participant.get_default_subscriber_qos(self.subscriber_qos)
    self.subscriber = self.participant.create_subscriber(self.subscriber_qos)

    self.reader_qos = fastdds_wrapper.DataReaderQos()
    self.subscriber.get_default_datareader_qos(self.reader_qos)
    self.reader = self.subscriber.create_datareader(self.topic, self.reader_qos)

  def read(self):
    info = fastdds_wrapper.SampleInfo()
    data = HelloWorld.HelloWorld()
    self.reader.take_next_sample(data, info)
    
    print("Received {message} : {index}".format(message=data.message(), index=data.index()))

  def delete(self):
    factory = fastdds_wrapper.DomainParticipantFactory.get_instance()
    self.participant.delete_contained_entities()
    factory.delete_participant(self.participant)

  def run(self):
    keep_going = 'y'
    while keep_going != 'n':
      if keep_going == 'y':
        self.read()
      keep_going = input('Send another sample? (y-yes, n-no): ')
    self.delete()

class Writer:
  def __init__(self, domain, machine):
    self.machine = machine

    factory = fastdds_wrapper.DomainParticipantFactory.get_instance()
    self.participant_qos = fastdds_wrapper.DomainParticipantQos()
    factory.get_default_participant_qos(self.participant_qos)
    self.participant = factory.create_participant(domain, self.participant_qos)

    self.topic_data_type = HelloWorld.HelloWorldPubSubType()
    self.topic_data_type.setName("HelloWorldDataType")
    self.type_support = fastdds_wrapper.TypeSupport(self.topic_data_type)
    self.participant.register_type(self.type_support)

    self.topic_qos = fastdds_wrapper.TopicQos()
    self.participant.get_default_topic_qos(self.topic_qos)
    self.topic = self.participant.create_topic("myTopic", self.topic_data_type.getName(), self.topic_qos)

    self.publisher_qos = fastdds_wrapper.PublisherQos()
    self.participant.get_default_publisher_qos(self.publisher_qos)
    self.publisher = self.participant.create_publisher(self.publisher_qos)

    self.writer_qos = fastdds_wrapper.DataWriterQos()
    self.publisher.get_default_datawriter_qos(self.writer_qos)
    self.writer = self.publisher.create_datawriter(self.topic, self.writer_qos)
    
    self.index = 0

  def write(self):
    data = HelloWorld.HelloWorld()
    if self.machine:
      data.message("Hello World " + self.machine)
    else:
      data.message("Hello World")
    data.index(self.index)
    self.writer.write(data)
    print("Sending {message} : {index}".format(message=data.message(), index=data.index()))
    self.index = self.index + 1

  def delete(self):
    factory = fastdds_wrapper.DomainParticipantFactory.get_instance()
    self.participant.delete_contained_entities()
    factory.delete_participant(self.participant)

  def run(self):
    keep_going = 'y'
    while keep_going != 'n':
      if keep_going == 'y':
        self.write()
      keep_going = input('Send another sample? (y-yes, n-no): ')
    self.delete()

def parse_options():
  """"
  Parse arguments.

  :return: Parsed arguments.
  """
  parser = argparse.ArgumentParser(
    formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    add_help=True,
    description=(DESCRIPTION),
    usage=(USAGE)
  )
  required_args = parser.add_argument_group('required arguments')
  required_args.add_argument(
    '-d',
    '--domain',
    type=int,
    required=False,
    help='DomainID.'
  )
  required_args.add_argument(
    '-p',
    '--parameter',
    type=str,
    required=True,
    help='Whether the application is run as publisher or subscriber.'
  )
  required_args.add_argument(
    '-m',
    '--machine',
    type=str,
    required=False,
    help='Distinguish the machine publishing. Only applies if the application is run as publisher.'

  )
  return parser.parse_args()

if __name__ == '__main__':
  # Parse arguments
  args = parse_options()
  if not args.domain:
    args.domain = 0

  if args.parameter == 'publisher':
    print('Creating publisher.')
    writer = Writer(args.domain, args.machine)
    writer.run()
  elif args.parameter == 'subscriber':
    print('Creating subscriber.')
    reader = Reader(args.domain)
    reader.run()
  else:
    print('Error: Incorrect arguments.')
    print(USAGE)

  exit()