import React, { Fragment } from 'react';
import {
    Input,
    InputGroup,
    Button,
    TabPane,
    Row,
    Col
} from 'reactstrap';
import './tabs.css';
import ReactTable from 'react-table';
import "react-table/react-table.css";


const ClientRolesSelect = (props) => {
    const { roles, onChangeHandler, selected } = props;
    return (
        <Input defaultValue={selected} type="select" name="select" id="rolesSelect" onChange={onChangeHandler}>
            {roles.map(role => <option key={role.id} value={role.id}>
            {role.name}</option>)}
        </Input>
    );
}

export class ClientsTab extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            clients: [],
            displayedStatuses: [],
            roles: [],
            isLoading: true,
            updateId: null,
            updateRoleId: null,
            minDate: null,
            maxDate: null,
            statusFilter: 'All'
        }
    }

    onChangeHandler = (e) => {
        this.setState({updateRoleId: e.target.value});
    }

    updateClient = () => {
        {
            fetch(`http://localhost:3000/api/client?id=${+this.state.updateId}&roleid=${+this.state.updateRoleId}`, {
                method: 'PUT'
            }).then(r => {
                this.setState({
                    updateId: null,
                    updateRoleId: null
                });
                this.getClients();
            })
                .catch(err => {
                    console.log(err);
                })
        }
    }

    getClients = () => {
        fetch('http://localhost:3000/api/clients')
            .then(r => r.json())
            .then(data => {
                const updatedData = data.map(user => {
                    console.log();
                    return {
                        id: user.Id,
                        name: `${user.Name} ${user.Surname}`,
                        phone: `${user.Phone}`,
                        delivery: `${user.DeliveryType ? 'yes' : 'no'}`,
                        role: user.RoleTitle,
                        roleid: user.RoleId,
                        address: `${user.StreetTitle ? `${user.StreetTitle} ${user.StreetType}` : 'no address'}`
                    };
                }).filter(user => user.id != this.props.userInfo.id);
                this.setState({ clients: updatedData });
            });
    }

    componentDidMount = () => {
        fetch('http://localhost:3000/api/roles')
        .then(r => r.json())
        .then(data => {
            const updatedData = data.map(role => {
                
                return { id: +role.Id,
                name: role.Title 
            };
            }).filter(role => role.name !== 'Admin');
            this.setState({ roles: updatedData });
            this.getClients();
        });
    }

    render() {
        const { state, props } = this;
        const isManager = props.userInfo.role === 'Manager';
        return  (<TabPane tabId={props.tabId} className="tabs-wrapper">
                    <Col sm="12">
                        <Row className="item">
                        </Row>
                        <Row>
                            <ReactTable 
                                className="col-sm-12"
                                showPagination={false}
                                minRows={0}
                                data={state.clients}
                                columns={[
                                    {
                                        Header: "User Name",
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
                                        accessor: 'role',
                                        Cell: row => {
                                            const isUpdated = +state.updateId === +row.original.id;
                                            return isUpdated ? <ClientRolesSelect roles={state.roles}
                                            selected={+row.original.roleid} onChangeHandler={this.onChangeHandler} /> 
                                            : <>{row.value}</>
                                        }
                                    },
                                    {
                                        Header: "Address",
                                        accessor: 'address'
                                    },
                                    {
                                        Header: "",
                                        accessor: 'id',
                                        Cell: row => {
                                            return (<>{(!state.updateId && !isManager) && <Button onClick={() => { 
                                                this.setState({updateId: row.value})
                                                console.log(row.rowValues);
                                            }}>Update</Button>}
                                            {state.updateId === row.value && (<><Button onClick={this.updateClient}>Save changes</Button><br/>
                                            <Button style={{ marginTop: '5px' }} onClick={() => this.setState({updateId: null, updateRoleId: null})}>Cancel</Button>
                                            </>)}</>);
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
 export default ClientsTab;

