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

export class TestDrivesTab extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            testdrives: [],
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
        const isUser = this.props.userInfo.role === 'User';
        isUser ? this.getTestDrivesByUser() : this.getTestDrives();
    }

    getTestDrives = () => {
        fetch(`http://localhost:3000/api/testdrives`)
            .then(r => r.json())
            .then(data => {
                if (data) {
                    const updatedData = data.map(testdrive => {

                        return {
                            dateValue: testdrive.Date,
                            userid: testdrive.UserId,
                            date: dayjs(testdrive.Date).format('DD/MM/YYYY HH:mm'),
                            auto: `${testdrive.Brand} ${testdrive.Model}`,
                            user: `${testdrive.Name}, ${testdrive.Phone}`
                        };
                    });
                    this.setState({ testdrives: updatedData });
                } else {
                    this.setState({ testdrives: [] })
                }
            });
    }

    getTestDrivesByUser = () => {
        fetch(`http://localhost:3000/api/testdrives/${this.props.userInfo.id}`)
            .then(r => r.json())
            .then(data => {
                if (data) {
                    const updatedData = data.map(testdrive => {

                        return {
                            dateValue: testdrive.Date,
                            userid: testdrive.UserId,
                            date: dayjs(testdrive.Date).format('DD/MM/YYYY HH:mm'),
                            auto: `${testdrive.Brand} ${testdrive.Model}`,
                        };
                    })
                    this.setState({ testdrives: updatedData });
                } else {
                    this.setState({ testdrives: [] });
                }

            });
    }
    render() {
        const { state, props } = this;
        const isUser = props.userInfo.role === 'User';
        return (<TabPane tabId={props.tabId} className="tabs-wrapper">
            <Col sm="12">
                <Row className="item">
                </Row>
                <Row>
                    {isUser ?
                        (
                            <ReactTable
                                className="col-sm-12"
                                showPagination={false}
                                minRows={0}
                                data={state.testdrives}
                                columns={[
                                    {
                                        Header: "Date",
                                        accessor: 'date'
                                    },
                                    {
                                        Header: "Auto",
                                        accessor: 'auto'
                                    }
                                ]}
                            />) :
                        (<ReactTable
                            className="col-sm-12"
                            showPagination={false}
                            minRows={0}
                            data={state.testdrives}
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
                                    Header: "User",
                                    accessor: 'user',
                                    sortable: false
                                }
                            ]}
                        />)}
                </Row>
            </Col>
        </TabPane>
        );
    }
}
export default TestDrivesTab;

