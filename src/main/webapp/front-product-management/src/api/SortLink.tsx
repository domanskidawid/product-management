import * as React from 'react';
import {Sort} from './index';

interface Props {
    sort: Sort;
    fieldName: string;
    children: React.ReactNode;

    onSortChange(sort: Sort): void;
}

const SortLink = (props: Props) => {
    const {
        sort,
        fieldName,
        onSortChange,
    } = props;

    const toggle = (direction: 'ASC' | 'DESC' | null) => {
        if (direction == null) return 'ASC';
        return direction === 'ASC' ? 'DESC' : 'ASC';
    }

    const onClick = () => {
        onSortChange({fieldName: fieldName, direction: toggle(sort.direction)});
    };

    const iconClasses = fieldName === sort.fieldName ? [
        'pl-2 text-primary fas',
        ...sort.direction === 'ASC' ? ['fa-chevron-up'] : sort.direction === 'DESC' ? ['fa-chevron-down'] : []] : []

    return (
        <button className="btn btn-link btn-sm" onClick={onClick}>
            {props.children}
            <i className={iconClasses.join(' ')}/>
        </button>
    );
}

export default SortLink;
