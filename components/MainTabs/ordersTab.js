import React, { Fragment } from 'react';
import {
    Input,
    InputGroup,
    TabPane,
    Row,
    Col,
    Button
} from 'reactstrap';
import './tabs.css';
import dayjs from 'dayjs';
import ReactTable from 'react-table';
import "react-table/react-table.css";
import moment from 'moment';

import DatePicker from 'react-datepicker';

const OrderStatusesSelect = (props) => <></>

export class OrdersTab extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            orders: [],
            displayedOrders: [],
            statuses: [],
            updateId: null,
            updateDate: null,
            updateStatusId: null,
            isLoading: true,
            minDate: null,
            maxDate: null,
            statusFilter: 'All'
        }
    }

    componentDidMount = () => {
        fetch('http://localhost:3000/api/statuses')
        .then(r => r.json())
        .then(data => {
            const updatedData = data.map(status => {
                
                return { id: status.Id,
                name: status.Title 
            };
            })
            this.setState({ statuses: updatedData });
        });
    }
    

    getOrders = () => {
        this.setState({ isLoading: true });
        fetch('http://localhost:3000/api/orders')
            .then(r => r.json())
            .then(data => {
                const updatedData = data.map(order => {
                    
                    return {
                        id: order.Id,
                        dateValue: order.Date,
                        date: dayjs(order.Date).format('DD/MM/YYYY HH:mm'),
                        auto: `${order.Brand} ${order.Model}`,
                        totalPrice: +order.TotalPrice,
                        status: order.StatusTitle,
                        statusid: order.StatusId,
                        bonuses: `
                        ${order.WindowRaisers ? 'Window raisers; ' : ''}
                        ${order.WheelDisks ? 'Wheel disks; ' : ''}
                        ${order.AdaptiveHeadlights ? 'Adaptive headlights; ' : ''}
                        ${order.CabinMaterial ? 'Cabin material; ' : ''}
                        ${order.HeatedSteeringWheel ? 'Heated steering wheel; ' : ''}
                        ${order.ParkingSensors ? 'Parking sensors; ' : ''}
                        ${order.RearViewCamera ? 'Rear-view camera; ' : ''}`,
                        user: `${order.Name}, ${order.Phone}`
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
                                        Header: "Date",
                                        accessor: 'date'
                                    },
                                    {
                                        Header: "Auto",
                                        accessor: 'auto'
                                    },
                                    {
                                        Header: "Total price",
                                        accessor: 'totalPrice'
                                    },
                                    {
                                        Header: "Status",
                                        accessor: 'status'
                                    },
                                    {
                                        Header: "Bonuses",
                                        accessor: 'bonuses',
                                        Cell: row => {
                                            const bonusesArr = row.value.split('; ');
                                            return(<>
                                                {bonusesArr.map((el, id) => <Fragment key={id}><span>{el}</span><br/></Fragment>)}
                                            </>
                                        )},
                                        sortable: false
                                    },
                                    {
                                        Header: "User",
                                        accessor: 'user',
                                        sortable: false
                                    },
                                    {
                                        Header: "",
                                        accessor: 'id',
                                        Cell: row => {
                                            return (<>
                                            { row.original.status === 'Rejected' ? null : 
                                            <>{!state.updateId && <Button onClick={() => { 
                                                this.setState({updateId: row.value})
                                                console.log(row.rowValues);
                                            }}>Update</Button>}
                                            {state.updateId === row.value && (<><Button onClick={() => this.setState({updateId: null})}>Save changes</Button><br/>
                                            <Button style={{ marginTop: '5px' }} onClick={() => this.setState({updateId: null})}>Cancel</Button>
                                            </>)}</>
                                            }
                                            </>);
                                        }
                                    }
                                ]}
                            />
                        </Row>
                    </Col>
                </TabPane>
            );
    }
}
 export default OrdersTab;

