import React, { Fragment } from 'react';
import {
    Input,
    InputGroup,
    TabPane,
    Row,
    Col
} from 'reactstrap';
import './tabs.css';
import dayjs from 'dayjs';
import ReactTable from 'react-table';
import "react-table/react-table.css";


export class ClientsTab extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            orders: [],
            displayedStatuses: [],
            isLoading: true,
            minDate: null,
            maxDate: null,
            statusFilter: 'All'
        }
    }

    getOrders = () => {
        this.setState({ isLoading: true });
        fetch('http://localhost:3000/api/clients')
            .then(r => r.json())
            .then(data => {
                const updatedData = data.map(user => {
                    
                    return {
                        name: `${user.Name} ${user.Surname}`,
                        phone: `${user.Phone}`,
                        delivery: `${user.DeliveryType ? 'yes' : 'no'}`,
                        role: user.RoleTitle,
                        address: `${user.StreetTitle ? `${user.StreetTitle} ${user.StreetType}` : 'no address'}`
                    };
                })
                this.setState({ orders: updatedData,
                    isLoading: false
                 });
            });
    }

    componentDidMount = () => {
      this.getOrders();
    }
    


    render() {
        const { state, props } = this;
        return  (<TabPane tabId={props.tabId} className="tabs-wrapper">
                    <Col sm="12">
                        <Row className="item">
                        </Row>
                        <Row>
                            <ReactTable 
                                className="col-sm-12"
                                showPagination={false}
                                minRows={0}
                                data={state.orders}
                                columns={[
                                    {
                                        Header: "User name",
                                        accessor: 'name'
                                    },
                                    {
                                        Header: "Phone",
                                        accessor: 'phone'
                                    },
                                    {
                                        Header: "Delivery",
                                        accessor: 'delivery'
                                    },
                                    {
                                        Header: "Role",
                                        accessor: 'role'
                                    },
                                    {
                                        Header: "Address",
                                        accessor: 'address',
                                        sortable: false
                                    }
                                ]}
                            />
                        </Row>
                    </Col>
                </TabPane>
            );
    }
}
 export default ClientsTab;

