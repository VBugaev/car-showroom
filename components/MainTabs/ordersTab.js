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
import isEqual from 'react-fast-compare';


const OrderStatusesSelect = (props) => {
    const { statuses, onChangeHandler, selected } = props;
    return (
        <Input defaultValue={selected} type="select" name="select" id="statusesSelect" onChange={onChangeHandler}>
            {statuses.map(status => <option key={status.id} value={status.id}>
            {status.name}</option>)}
        </Input>
    );
}

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

    onChangeHandler = (e) => {
        this.setState({updateStatusId: e.target.value});
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
            const isUser = this.props.userInfo.role === 'User';
            isUser ? this.getOrdersByUser() : this.getOrders();
        });
    }
    
    updateOrder = () => {
        fetch(`http://localhost:3000/api/order?id=${this.state.updateId}&statusid=${this.state.updateStatusId}`, {
            method: 'PUT'
        }).then(r => {
            this.setState({
                updateId: null,
                updateStatusId: null
            });
            this.getOrders();
        })
            .catch(err => {
                console.log(err);
            })
    }

    getOrders = () => {
        fetch(`http://localhost:3000/api/orders`)
            .then(r => r.json())
            .then(data => {
                if (data) {
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
                    });
                    this.setState({ orders: updatedData });
                } else {
                    this.setState({ orders: [] })
                }
            });
    }

    getOrdersByUser = () => {
        fetch(`http://localhost:3000/api/orders/${this.props.userInfo.id}`)
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
                this.setState({ orders: updatedData });
            });
    }
    render() {
        const { state, props } = this;
        const isUser = props.userInfo.role === 'User';
        return  (<TabPane tabId={props.tabId} className="tabs-wrapper">
                    <Col sm="12">
                        <Row className="item">
                        </Row>
                        <Row>
                            { isUser ?
                            (
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
                                    }
                                ]}
                            />) :
                            (<ReactTable 
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
                                        accessor: 'status',
                                        Cell: row => {
                                            const isUpdated = state.updateId === row.original.id;
                                            return isUpdated ? <OrderStatusesSelect statuses={state.statuses}
                                            selected={row.original.statusid} onChangeHandler={this.onChangeHandler} /> 
                                            : <>{row.value}</>
                                        }
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
                                            { row.original.status === 'Rejected' || row.original.status === 'Paid' ? null : 
                                            <>{!state.updateId && <Button onClick={() => { 
                                                this.setState({updateId: row.value})
                                                console.log(row.rowValues);
                                            }}>Update</Button>}
                                            {state.updateId === row.value && (<><Button onClick={this.updateOrder}>Save changes</Button><br/>
                                            <Button style={{ marginTop: '5px' }} onClick={() => this.setState({updateId: null, updateStatusId: null})}>Cancel</Button>
                                            </>)}</>
                                            }
                                            </>);
                                        }
                                    }
                                ]}
                            />)}
                        </Row>
                    </Col>
                </TabPane>
            );
    }
}
 export default OrdersTab;

