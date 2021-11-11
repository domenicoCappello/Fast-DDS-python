// Copyright 2022 Proyectos y Sistemas de Mantenimiento SL (eProsima).
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

%{
#include "fastdds/dds/domain/qos/DomainParticipantQos.hpp"
%}

namespace eprosima {

namespace fastdds {
namespace dds {

class UserDataQosPolicy;
class ParticipantResourceLimitsQos;
class PropertyPolicyQos;
class WireProtocolConfigQos;
class TransportConfigQos;

} // namespace dds
} // namespace fastdds

namespace fastrtps {

class string_255;

} // namespace fastrtps

namespace fastrtps {
namespace rtps {

class FlowControllerDescriptor;

} // namespace rtps
} // namespace fastrtps

} // namespace eprosima

//%include "fastdds/dds/domain/qos/DomainParticipantQos.hpp"


namespace eprosima {
namespace fastdds {
namespace dds {

class DomainParticipantQos
{

public:

    /**
     * @brief Constructor
     */
    RTPS_DllAPI DomainParticipantQos()
    {
    }

    /**
     * @brief Destructor
     */
    RTPS_DllAPI virtual ~DomainParticipantQos()
    {
    }

    bool operator ==(
            const DomainParticipantQos& b) const
    {
        return (this->user_data_ == b.user_data()) &&
               (this->entity_factory_ == b.entity_factory()) &&
               (this->allocation_ == b.allocation()) &&
               (this->properties_ == b.properties()) &&
               (this->wire_protocol_ == b.wire_protocol()) &&
               (this->transport_ == b.transport()) &&
               (this->name_ == b.name()) &&
               (this->flow_controllers_ == b.flow_controllers());
    }

    /**
     * Getter for UserDataQosPolicy
     * @return UserDataQosPolicy reference
     */
    const UserDataQosPolicy& user_data() const
    {
        return user_data_;
    }

    /**
     * Getter for UserDataQosPolicy
     * @return UserDataQosPolicy reference
     */
    UserDataQosPolicy& user_data()
    {
        return user_data_;
    }

    /**
     * Setter for UserDataQosPolicy
     * @param value UserDataQosPolicy
     */
    void user_data(
            const UserDataQosPolicy& value)
    {
        user_data_ = value;
    }

    /**
     * Getter for EntityFactoryQosPolicy
     * @return EntityFactoryQosPolicy reference
     */
    const EntityFactoryQosPolicy& entity_factory() const
    {
        return entity_factory_;
    }

    /**
     * Getter for EntityFactoryQosPolicy
     * @return EntityFactoryQosPolicy reference
     */
    EntityFactoryQosPolicy& entity_factory()
    {
        return entity_factory_;
    }

    /**
     * Setter for EntityFactoryQosPolicy
     * @param value EntityFactoryQosPolicy
     */
    void entity_factory(
            const EntityFactoryQosPolicy& value)
    {
        entity_factory_ = value;
    }

    /**
     * Getter for ParticipantResourceLimitsQos
     * @return ParticipantResourceLimitsQos reference
     */
    const ParticipantResourceLimitsQos& allocation() const
    {
        return allocation_;
    }

    /**
     * Getter for ParticipantResourceLimitsQos
     * @return ParticipantResourceLimitsQos reference
     */
    ParticipantResourceLimitsQos& allocation()
    {
        return allocation_;
    }

    /**
     * Setter for ParticipantResourceLimitsQos
     * @param allocation ParticipantResourceLimitsQos
     */
    void allocation(
            const ParticipantResourceLimitsQos& allocation)
    {
        allocation_ = allocation;
    }

    /**
     * Getter for PropertyPolicyQos
     * @return PropertyPolicyQos reference
     */
    const PropertyPolicyQos& properties() const
    {
        return properties_;
    }

    /**
     * Getter for PropertyPolicyQos
     * @return PropertyPolicyQos reference
     */
    PropertyPolicyQos& properties()
    {
        return properties_;
    }

    /**
     * Setter for PropertyPolicyQos
     * @param properties PropertyPolicyQos
     */
    void properties(
            const PropertyPolicyQos& properties)
    {
        properties_ = properties;
    }

    /**
     * Getter for WireProtocolConfigQos
     * @return WireProtocolConfigQos reference
     */
    const WireProtocolConfigQos& wire_protocol() const
    {
        return wire_protocol_;
    }

    /**
     * Getter for WireProtocolConfigQos
     * @return WireProtocolConfigQos reference
     */
    WireProtocolConfigQos& wire_protocol()
    {
        return wire_protocol_;
    }

    /**
     * Setter for WireProtocolConfigQos
     * @param wire_protocol WireProtocolConfigQos
     */
    void wire_protocol(
            const WireProtocolConfigQos& wire_protocol)
    {
        wire_protocol_ = wire_protocol;
    }

    /**
     * Getter for TransportConfigQos
     * @return TransportConfigQos reference
     */
    const TransportConfigQos& transport() const
    {
        return transport_;
    }

    /**
     * Getter for TransportConfigQos
     * @return TransportConfigQos reference
     */
    TransportConfigQos& transport()
    {
        return transport_;
    }

    /**
     * Setter for TransportConfigQos
     * @param transport TransportConfigQos
     */
    void transport(
            const TransportConfigQos& transport)
    {
        transport_ = transport;
    }

    /**
     * Getter for the Participant name
     * @return name
     */
    const fastrtps::string_255& name() const
    {
        return name_;
    }

    /**
     * Getter for the Participant name
     * @return name
     */
    fastrtps::string_255& name()
    {
        return name_;
    }

    /**
     * Setter for the Participant name
     * @return value New name to be set
     */
    void name(
            const fastrtps::string_255& value)
    {
        name_ = value;
    }

    std::vector<std::shared_ptr<fastdds::rtps::FlowControllerDescriptor>>& flow_controllers()
    {
        return flow_controllers_;
    }

    const std::vector<std::shared_ptr<fastdds::rtps::FlowControllerDescriptor>>& flow_controllers() const
    {
        return flow_controllers_;
    }
};

} // namespace dds
} // namespace fastdds
} // namespace eprosima